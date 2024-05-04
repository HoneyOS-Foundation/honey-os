use std::sync::{Arc, Mutex};

use anyhow::anyhow;
use honeyos_process::ProcessManager;
use wasm_bindgen::{closure::Closure, JsCast};
use wasm_bindgen_futures::JsFuture;
use web_sys::{
    js_sys::{ArrayBuffer, Uint8Array},
    Blob, Event, FileReader, Request, RequestInit, RequestMode, Response, Window,
};

use crate::api::register_api;

/// The system process manager
static mut PROCESS_MANAGER: Option<Arc<Mutex<ProcessManager>>> = None;

/// Initialize the process manager
pub async fn init_process_manager(window: &Window) -> anyhow::Result<()> {
    let process_manager = ProcessManager::new(register_api);
    // SAFETY: Since the process manager is in a mutex, it is now thread-safe
    unsafe { PROCESS_MANAGER = Some(Arc::new(Mutex::new(process_manager))) };
    // Requests the boot executable. Will summon the boot process when complete
    request_boot_executable(window).await?;
    Ok(())
}

/// Get the process manager
pub fn process_manager() -> Arc<Mutex<ProcessManager>> {
    unsafe { PROCESS_MANAGER.as_ref().unwrap().clone() }
}

/// Fetch boot.wasm. Summon the boot process when complete
async fn request_boot_executable(window: &Window) -> anyhow::Result<()> {
    const BOOT_BINARY_NAME: &str = "boot.wasm";

    let mut opts = RequestInit::new();
    opts.method("GET");
    opts.mode(RequestMode::Cors);

    // Request the bootloader from the root dir
    let request = Request::new_with_str_and_init(BOOT_BINARY_NAME, &opts)
        .map_err(|e| anyhow!("Failed to fetch {}: {:?}", BOOT_BINARY_NAME, e))?;
    let response = JsFuture::from(window.fetch_with_request(&request))
        .await
        .map_err(|e| anyhow!("Failed to fetch {}: {:?}", BOOT_BINARY_NAME, e))?;
    let response: Response = response
        .dyn_into()
        .map_err(|e| anyhow!("Failed to cast to response: {:?}", e))?;

    // Get the blob from the request
    let blob = response
        .blob()
        .map_err(|e| anyhow!("Faied to read boot blob: {:?}", e))?;
    let blob = JsFuture::from(blob)
        .await
        .map_err(|e| anyhow!("Failed to execute boot future: {:?}", e))?;
    let blob: Blob = blob
        .dyn_into()
        .map_err(|e| anyhow!("Failed to convert boot to blob: {:?}", e))?;

    // Setup the file loading sequence
    let file_reader =
        FileReader::new().map_err(|e| anyhow!("Failed to read {}: {:?}", BOOT_BINARY_NAME, e))?;
    file_reader.read_as_array_buffer(&blob).unwrap();
    let onload = Closure::wrap(Box::new(move |event: Event| {
        let file_reader: FileReader = event.target().unwrap().dyn_into().unwrap();
        let result = file_reader.result().unwrap();
        let result: ArrayBuffer = result.dyn_into().unwrap();

        let array = Uint8Array::new(&result);
        let mut buffer = vec![0; array.length() as usize];
        array.copy_to(&mut buffer);

        // Summon the boot process
        let process_manager = process_manager();
        let mut process_manager = process_manager.lock().unwrap();
        process_manager.spawn(buffer, Some("BOOT".into()));
    }) as Box<dyn FnMut(_)>);

    file_reader.set_onload(Some(onload.as_ref().unchecked_ref()));
    onload.forget();

    Ok(())
}
