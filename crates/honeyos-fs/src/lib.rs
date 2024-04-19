use fshandler::FsHandler;

pub mod filetable;
pub mod fshandler;
pub mod localfs;
pub mod ramfs;
pub mod tests;

/// Filesystem manager
pub struct FsManager {
    root: Box<dyn FsHandler>,
}

impl FsManager {
    /// Create a new filesystem manager
    pub fn new(root: Box<dyn FsHandler>) -> Self {
        Self { root }
    }

    /// Get the root filesystem handler
    pub fn root(&self) -> &dyn FsHandler {
        &*self.root
    }

    /// Get the root filesystem handler
    pub fn root_mut(&mut self) -> &mut dyn FsHandler {
        &mut *self.root
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
