use std::sync::{Arc, Mutex, MutexGuard, Once};

use fshandler::FsHandler;

pub mod filetable;
pub mod fshandler;
pub mod localfs;
pub mod ramfs;
pub mod tests;

static mut FS_MANAGER: Option<Arc<Mutex<FsManager>>> = None;

/// Filesystem manager
pub struct FsManager {
    root: Option<Box<dyn FsHandler>>,
}

impl FsManager {
    /// Initialize the file manager
    pub fn init_once() {
        static SET_HOOK: Once = Once::new();
        SET_HOOK.call_once(|| unsafe {
            FS_MANAGER = Some(Arc::new(Mutex::new(FsManager { root: None })))
        });
    }

    /// Get the static instance
    pub fn get<'a>() -> Option<MutexGuard<'a, FsManager>> {
        let fs = unsafe {
            FS_MANAGER
                .as_ref()
                .expect("File system manager not handled")
        };
        fs.try_lock().ok()
    }

    /// Get the static instance.
    /// Blocks until locked.
    pub fn blocking_get<'a>() -> MutexGuard<'a, FsManager> {
        let fs = unsafe {
            FS_MANAGER
                .as_ref()
                .expect("File system manager not handled")
        };
        loop {
            let Ok(fs) = fs.try_lock() else {
                continue;
            };
            return fs;
        }
    }

    /// Get the root filesystem handler
    pub fn root(&self) -> &dyn FsHandler {
        self.root.as_deref().unwrap()
    }

    /// Get the root filesystem handler
    pub fn root_mut(&mut self) -> &mut dyn FsHandler {
        self.root.as_deref_mut().unwrap()
    }
}

/// Convert a path to the smallest possible representation
/// This is done by handling shortcuts like `..` and `.` in the path
pub fn normalize_path(path: &str) -> String {
    let parts = path.split('/').collect::<Vec<_>>();
    let mut new_parts = Vec::new();
    for part in parts.iter() {
        if part == &"." {
            continue;
        } else if part == &".." {
            new_parts.pop();
        } else {
            new_parts.push(part);
        }
    }
    // Remove double slashes
    let new_parts = new_parts
        .iter()
        .filter(|p| !p.is_empty())
        .collect::<Vec<_>>();
    let new_parts = new_parts.iter().map(|p| p.to_string()).collect::<Vec<_>>();
    let mut new_parts = new_parts.join("/");
    new_parts.insert(0, '/');
    new_parts
}
