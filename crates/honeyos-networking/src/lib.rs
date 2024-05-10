pub mod error;
pub mod request;

use std::sync::{Arc, Mutex, MutexGuard, Once};

use crate::error::Error;
use hashbrown::HashMap;
use request::{Request, RequestMethod, RequestMode, RequestStatus, ScheduledRequest};
use uuid::Uuid;
use wasm_bindgen_futures::JsFuture;
use web_sys::{
    js_sys::{ArrayBuffer, Uint8Array, JSON},
    wasm_bindgen::{closure::Closure, JsCast, JsValue},
    Blob, Event, FileReader, RequestInit, Response,
};

/// The static instance
static mut NETWORKING_MANAGER: Option<Arc<Mutex<NetworkingManager>>> = None;

/// The networking manager for the honeyos kernel
#[derive(Debug)]
pub struct NetworkingManager {
    scheduled: HashMap<Uuid, ScheduledRequest>,
    requests: HashMap<Uuid, Request>,
}

impl NetworkingManager {
    /// Get the static instance
    pub fn get<'a>() -> Option<MutexGuard<'a, Self>> {
        let networking_manager = unsafe {
            NETWORKING_MANAGER
                .as_ref()
                .expect("Display server not initialized")
        };
        networking_manager.try_lock().ok()
    }

    /// Get the static instance.
    /// Blocks until locked.
    pub fn blocking_get<'a>() -> MutexGuard<'a, Self> {
        let networking_manager = unsafe {
            NETWORKING_MANAGER
                .as_ref()
                .expect("Display server not initialized")
        };
        loop {
            if let Ok(networking_manager) = networking_manager.try_lock() {
                return networking_manager;
            }
        }
    }
}

impl NetworkingManager {
    /// Initialize the networking manager.
    /// Should only be called once.
    pub fn init_once() {
        static SET_HOOK: Once = Once::new();
        SET_HOOK.call_once(|| unsafe {
            NETWORKING_MANAGER = Some(Arc::new(Mutex::new(NetworkingManager {
                scheduled: HashMap::new(),
                requests: HashMap::new(),
            })))
        });
    }

    /// Create a request.
    /// Returns it'd id
    pub fn request(
        &mut self,
        url: impl Into<String>,
        method: RequestMethod,
        mode: RequestMode,
        headers: impl Into<String>,
    ) -> Uuid {
        let url: String = url.into();
        let headers: String = headers.into();

        let id = Uuid::new_v4();

        self.scheduled.insert(
            id,
            ScheduledRequest {
                url,
                method,
                mode,
                headers,
            },
        );
        id
    }

    /// Return the status of a request.
    /// Returns none if the request does not exist.
    pub fn status(&self, id: Uuid) -> Option<RequestStatus> {
        if self.scheduled.contains_key(&id) {
            return Some(RequestStatus::Pending);
        }
        let request = self.requests.get(&id)?;
        Some(request.status)
    }

    /// Return the data of a request.
    /// Return none if the request does not exist
    pub fn data(&self, id: Uuid) -> Option<Vec<u8>> {
        let request = self.requests.get(&id)?;
        Some(request.data.clone())
    }

    /// Return the length in bytes of the data in the request
    /// Return none if the request does not exist
    pub fn data_length(&self, id: Uuid) -> Option<usize> {
        let request = self.requests.get(&id)?;
        Some(request.data.len())
    }

    /// Remove the request from the queue.
    /// Do nothing if it does not exist
    pub fn remove(&mut self, id: Uuid) {
        self.requests.remove(&id);
    }

    /// Update the network manager
    pub fn update(&mut self) -> Result<(), Error> {
        for (id, scheduled) in self.scheduled.clone().iter() {
            self.process_request(*id, scheduled)?;
            self.scheduled.remove(id);
        }

        Ok(())
    }

    // Proess a request
    fn process_request(&mut self, id: Uuid, scheduled: &ScheduledRequest) -> Result<(), Error> {
        self.requests.insert(
            id,
            Request {
                data: Vec::new(),
                status: RequestStatus::Processing,
            },
        );

        // Setup the request
        let headers = JSON::parse(&scheduled.headers).map_err(|e| Error::HeaderParseFailure(e))?;
        let mut request_init = RequestInit::new();
        request_init.mode(scheduled.mode.into());
        request_init.method(&scheduled.method.to_string());
        request_init.headers(&headers);

        // Create the request. The request will update the status in the NetworkManager when complete
        let window = web_sys::window().unwrap();
        let request = web_sys::Request::new_with_str_and_init(&scheduled.url, &request_init)
            .map_err(|e| Error::RequestInitFailure(e))?;
        wasm_bindgen_futures::spawn_local(async move {
            JsFuture::from(
                window
                    .fetch_with_request(&request)
                    .then(&Closure::new(move |response: JsValue| {
                        wasm_bindgen_futures::spawn_local(async move {
                            let response: Response = response.dyn_into().unwrap();

                            if !response.ok() {
                                let mut networking_manager = NetworkingManager::blocking_get();
                                let Some(request) = networking_manager.requests.get_mut(&id) else {
                                    return;
                                };
                                request.status = RequestStatus::Fail;
                                return;
                            }

                            let blob = extract_blob(response).await.unwrap();
                            read_and_update(id, blob);
                        })
                    }))
                    .catch(&Closure::new(move |_| {
                        let mut networking_manager = NetworkingManager::blocking_get();
                        let Some(request) = networking_manager.requests.get_mut(&id) else {
                            return;
                        };
                        request.status = RequestStatus::Fail;
                    })),
            )
            .await
            .unwrap();
        });

        Ok(())
    }
}

/// Extract the blob from the executable
async fn extract_blob(response: Response) -> Option<Blob> {
    let blob = response.blob().ok()?;
    let blob = JsFuture::from(blob).await.ok()?;
    blob.dyn_into().ok()
}

/// Read the blob and update the request status
fn read_and_update(id: Uuid, blob: Blob) {
    let file_reader = FileReader::new().unwrap();
    file_reader.read_as_array_buffer(&blob).unwrap();

    let onload = Closure::wrap(Box::new(move |event: Event| {
        let file_reader: FileReader = event.target().unwrap().dyn_into().unwrap();
        let result = file_reader.result().unwrap();
        let result: ArrayBuffer = result.dyn_into().unwrap();

        let array = Uint8Array::new(&result);
        let mut buffer = vec![0; array.length() as usize];
        array.copy_to(&mut buffer);

        let mut networking_manager = NetworkingManager::blocking_get();
        let Some(request) = networking_manager.requests.get_mut(&id) else {
            return;
        };
        request.status = RequestStatus::Success;
        request.data.clone_from(&buffer);
    }) as Box<dyn FnMut(_)>);

    file_reader.set_onload(Some(onload.as_ref().unchecked_ref()));
    onload.forget();
}
