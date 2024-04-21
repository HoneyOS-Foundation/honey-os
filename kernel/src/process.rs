use std::sync::{Arc, Mutex};

use honeyos_process::ProcessManager;

use crate::display::HeadDisplay;

/// The system process manager
static mut PROCESS_MANAGER: Option<Arc<Mutex<ProcessManager>>> = None;

/// Initialize the process manager
pub fn init_process_manager(document: &web_sys::Document) {
    // SAFETY: Since the process manager is in a mutex, it is now thread-safe
    let mut process_manager = ProcessManager::new();

    let process_element = document.create_element("div").unwrap();
    process_element.set_id("pd-1");
    let display = HeadDisplay::get().clone();
    log::info!("Attempting to get display");
    let display = display.lock().unwrap();

    display.append(&process_element);
    process_manager.spawn(
        Vec::new(),
        Some("Helloworld!".into()),
        Some(process_element.clone()),
    );
    process_manager.spawn(
        Vec::new(),
        Some("Helloworld!".into()),
        Some(process_element),
    );

    log::info!("Display fetched");
    unsafe { PROCESS_MANAGER = Some(Arc::new(Mutex::new(process_manager))) }
}

/// Get the process manager
pub fn process_manager() -> Arc<Mutex<ProcessManager>> {
    unsafe { PROCESS_MANAGER.as_ref().unwrap().clone() }
}
