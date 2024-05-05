use anyhow::anyhow;
use honeyos_process::ProcessManager;
use wasm_bindgen::{closure::Closure, JsCast};
use wasm_bindgen_futures::JsFuture;
use web_sys::{
    js_sys::{ArrayBuffer, Uint8Array},
    Blob, Event, FileReader, Request, RequestInit, RequestMode, Response, Window,
};

/// The name of the binary the kernel tries to load
const BOOT_BINARY_NAME: &str = "boot.wasm";

/// Fetch boot.wasm. Summon the boot process when complete
pub async fn request_boot_executable(window: &Window) -> anyhow::Result<()> {
    let response = fetch_boot_executable(BOOT_BINARY_NAME, window).await?;
    let blob = extract_blob(response).await?;
    read_and_execute(blob)?;

    Ok(())
}

/// Fetch the boot executable from the root dir
async fn fetch_boot_executable(bin_name: &str, window: &Window) -> anyhow::Result<Response> {
    let mut opts = RequestInit::new();
    opts.method("GET");
    opts.mode(RequestMode::Cors);

    let request = Request::new_with_str_and_init(bin_name, &opts)
        .map_err(|e| anyhow!("Failed to fetch {}: {:?}", bin_name, e))?;
    let response = JsFuture::from(window.fetch_with_request(&request))
        .await
        .map_err(|e| anyhow!("Failed to fetch {}: {:?}", bin_name, e))?;
    response
        .dyn_into()
        .map_err(|e| anyhow!("Failed to cast to response: {:?}", e))
}

/// Extract the blob from the executable
async fn extract_blob(response: Response) -> anyhow::Result<Blob> {
    let blob = response
        .blob()
        .map_err(|e| anyhow!("Faied to read boot blob: {:?}", e))?;
    let blob = JsFuture::from(blob)
        .await
        .map_err(|e| anyhow!("Failed to execute boot future: {:?}", e))?;
    blob.dyn_into()
        .map_err(|e| anyhow!("Failed to convert boot to blob: {:?}", e))
}

/// Read the blob and schedule execution
fn read_and_execute(blob: Blob) -> anyhow::Result<()> {
    let file_reader =
        FileReader::new().map_err(|e| anyhow!("Failed to read boot executable: {:?}", e))?;
    file_reader.read_as_array_buffer(&blob).unwrap();

    let onload = Closure::wrap(Box::new(move |event: Event| {
        let file_reader: FileReader = event.target().unwrap().dyn_into().unwrap();
        let result = file_reader.result().unwrap();
        let result: ArrayBuffer = result.dyn_into().unwrap();

        let array = Uint8Array::new(&result);
        let mut buffer = vec![0; array.length() as usize];
        array.copy_to(&mut buffer);

        // Summon the boot process
        let mut process_manager = ProcessManager::blocking_get();
        process_manager.spawn(buffer, Some("BOOT".into()));
    }) as Box<dyn FnMut(_)>);

    file_reader.set_onload(Some(onload.as_ref().unchecked_ref()));
    onload.forget();
    Ok(())
}
