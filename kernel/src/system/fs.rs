use honeyos_fs::{ramfs::RamFsHandler, FsManager};
use std::sync::{Arc, Mutex, Once};

/// The filesystem manager of the OS
static mut FS_MANAGER: Option<Arc<Mutex<FsManager>>> = None;

/// Initialize the filesystem manager of the OS
/// This function should be called only once
pub fn init_fs_manager() {
    static SET_HOOK: Once = Once::new();
    SET_HOOK.call_once(|| unsafe {
        FS_MANAGER = Some(Arc::new(Mutex::new(FsManager::new(Box::new(
            RamFsHandler::new(),
        )))));
    });
}

/// Get the filesystem manager of the OS
pub fn fs_manager() -> Arc<Mutex<FsManager>> {
    unsafe { FS_MANAGER.clone().unwrap() }
}
