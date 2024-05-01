use std::sync::{Arc, Mutex};

use honeyos_process::ProcessManager;

/// The system process manager
static mut PROCESS_MANAGER: Option<Arc<Mutex<ProcessManager>>> = None;

const TEST_WASM: &[u8] = include_bytes!("../../test/helloworld.wasm");

/// Initialize the process manager
pub fn init_process_manager() {
    // SAFETY: Since the process manager is in a mutex, it is now thread-safe
    let mut process_manager = ProcessManager::new();

    process_manager.spawn(TEST_WASM.to_vec(), Some("Helloworld! - 0".into()));
    process_manager.spawn(TEST_WASM.to_vec(), Some("Helloworld! - 1".into()));
    process_manager.spawn(TEST_WASM.to_vec(), Some("Helloworld! - 2".into()));

    unsafe { PROCESS_MANAGER = Some(Arc::new(Mutex::new(process_manager))) }
}

/// Get the process manager
pub fn process_manager() -> Arc<Mutex<ProcessManager>> {
    unsafe { PROCESS_MANAGER.as_ref().unwrap().clone() }
}
