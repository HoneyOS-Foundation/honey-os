use std::sync::{Arc, Mutex, MutexGuard, Once};

use fshandler::FsHandler;
use hashbrown::HashMap;

pub mod error;
pub mod filetable;
pub mod fshandler;
pub mod localfs;
pub mod ramfs;
pub mod tests;

static mut FS_MANAGER: Option<Arc<Mutex<FsManager>>> = None;

/// The label for a mounted file system
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
#[rustfmt::skip]
pub enum FsLabel {
    A,B,C,D,E,
    F,G,H,I,J,
    K,L,M,N,O,
    P,Q,R,S,T,
    U,V,W,X,Y,
    Z,
}
/// Filesystem managers
pub struct FsManager {
    handlers: HashMap<FsLabel, Box<dyn FsHandler>>,
}

impl FsManager {
    /// Initialize the file manager
    pub fn init_once() {
        static SET_HOOK: Once = Once::new();
        SET_HOOK.call_once(|| unsafe {
            FS_MANAGER = Some(Arc::new(Mutex::new(FsManager {
                handlers: HashMap::new(),
            })))
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

    /// Register the file system
    pub fn register_fs<T>(&mut self, fs: T)
    where
        T: FsHandler,
    {
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
