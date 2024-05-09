use std::sync::{Arc, Mutex, MutexGuard, Once};

use hashbrown::HashMap;
use uuid::Uuid;
use wasm_bindgen_futures::JsFuture;
use web_sys::{
    js_sys::{ArrayBuffer, Uint8Array, JSON},
    wasm_bindgen::{closure::Closure, JsCast, JsValue},
    Blob, Event, FileReader, Request, RequestInit, Response,
};

/// The static instance
static mut NETWORKING_MANAGER: Option<Arc<Mutex<NetworkingManager>>> = None;

/// The status of a request
#[derive(Debug, Clone)]
pub enum RequestStatus {
    Processing,
    Success(Vec<u8>),
    Fail,
}

/// The networking manager for the honeyos kernel
#[derive(Debug)]
pub struct NetworkingManager {
    requests: HashMap<Uuid, RequestStatus>,
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
                requests: HashMap::new(),
            })))
        });
    }

    /// Create a request.
    /// Returns it'd id
    pub fn request(&mut self, url: impl Into<String>, headers: impl Into<String>) -> Option<Uuid> {
        let url: String = url.into();
        let headers: String = headers.into();

        let id = Uuid::new_v4();
        self.requests.insert(id, RequestStatus::Processing);

        // Setup the request
        let headers = JSON::parse(&headers).ok()?;
        let mut request_init = RequestInit::new();
        request_init.headers(&headers);

        // Create the request. The request will update the status in the NetworkManager when complete
        let window = web_sys::window().unwrap();
        let request = Request::new_with_str_and_init(&url, &request_init).unwrap();
        wasm_bindgen_futures::spawn_local(async move {
            JsFuture::from(
                window
                    .fetch_with_request(&request)
                    .then(&Closure::new(move |response: JsValue| {
                        wasm_bindgen_futures::spawn_local(async move {
                            let response = response.dyn_into().unwrap();
                            let blob = extract_blob(response).await.unwrap();
                            read_and_update(id, blob);
                        })
                    }))
                    .catch(&Closure::new(move |_| {
                        let mut networking_manager = NetworkingManager::blocking_get();
                        let Some(status) = networking_manager.requests.get_mut(&id) else {
                            return;
                        };
                        *status = RequestStatus::Fail
                    })),
            )
            .await
            .unwrap();
        });

        Some(id)
    }

    /// Return the status of a request
    pub fn status(&self, id: Uuid) -> Option<RequestStatus> {
        let request = self.requests.get(&id)?;
        Some(request.clone())
    }

    /// Remove the request from the queue.
    /// Do nothing if it does not exist
    pub fn remove(&mut self, id: Uuid) {
        self.requests.remove(&id);
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
        let Some(status) = networking_manager.requests.get_mut(&id) else {
            return;
        };
        *status = RequestStatus::Success(array.to_vec())
    }) as Box<dyn FnMut(_)>);

    file_reader.set_onload(Some(onload.as_ref().unchecked_ref()));
    onload.forget();
}
