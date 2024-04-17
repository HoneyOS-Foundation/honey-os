use serde::{Deserialize, Serialize};
use uuid::Uuid;

/// An item in the file table
#[derive(Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum TableItem {
    File,
    Directory,
}

/// The result of a path lookup
#[derive(Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum PathResult {
    File(Uuid),
    Directory(Uuid),
}

/// A file table for the system
#[derive(Debug, Serialize, Deserialize)]
pub struct FileTable {
    pub directories: hashbrown::HashMap<Uuid, Directory>,
    pub files: hashbrown::HashMap<Uuid, File>,
}

/// A file in the file table
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct File {
    pub id: Uuid,
    pub name: String,
    pub modified: u64,
    pub created: u64,
}

/// A directory in the file table
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Directory {
    pub parent: Option<Uuid>,
    pub id: Uuid,
    pub name: String,
    pub files: Vec<Uuid>,
    pub directories: Vec<Uuid>,
}

impl FileTable {
    /// Create a new file table
    pub fn new() -> Self {
        let mut directories = hashbrown::HashMap::new();
        // Create the root directory
        let root_id = Uuid::nil();
        let root = Directory {
            parent: None,
            id: root_id,
            name: "/".to_string(),
            files: Vec::new(),
            directories: Vec::new(),
        };
        directories.insert(root_id, root);

        Self {
            directories,
            files: hashbrown::HashMap::new(),
        }
    }

    /// Create a new item in the file table
    pub fn create(&mut self, path: &str, item: TableItem) -> Option<Uuid> {
        let parts = path.split('/').filter(|p| !p.is_empty());
        let mut current = Uuid::nil();
        for part in parts.clone() {
            if let Some(dir) = self.directories.get(&current) {
                if let Some(id) = dir.directories.iter().find(|id| {
                    if let Some(directory) = self.directories.get(*id) {
                        directory.name == part
                    } else {
                        false
                    }
                }) {
                    current = *id;
                }
            }
        }
        let id = Uuid::new_v4();
        match item {
            TableItem::File => {
                let file_name = parts.last().unwrap();
                let file = File {
                    id,
                    name: file_name.to_string(),
                    modified: get_time(),
                    created: get_time(),
                };
                self.files.insert(id, file);
                if let Some(dir) = self.directories.get_mut(&current) {
                    dir.files.push(id);
                }
            }
            TableItem::Directory => {
                let dir_name = parts.last().unwrap();
                let dir = Directory {
                    parent: Some(current),
                    id,
                    name: dir_name.to_string(),
                    files: Vec::new(),
                    directories: Vec::new(),
                };
                self.directories.insert(id, dir);
                if let Some(dir) = self.directories.get_mut(&current) {
                    dir.directories.push(id);
                }
            }
        }
        Some(id)
    }

    /// Get an item from path.
    /// A path is a string that starts with a `/` and is separated by `/`.
    /// `..` is used to go up a directory.
    /// `.` is used to stay in the same directory.
    pub fn get(&self, path: &str, item: TableItem) -> Option<PathResult> {
        let mut current = Uuid::nil();
        let parts = path.split('/').filter(|p| !p.is_empty());
        for part in parts.clone() {
            if part == ".." {
                if let Some(dir) = self.directories.get(&current) {
                    if let Some(parent) = dir.parent {
                        current = parent;
                    } else {
                        current = Uuid::nil();
                    }
                }
            } else if part == "." {
                continue;
            } else {
                if let Some(dir) = self.directories.get(&current) {
                    if let Some(id) = dir.directories.iter().find(|id| {
                        if let Some(directory) = self.directories.get(*id) {
                            directory.name == part
                        } else {
                            false
                        }
                    }) {
                        current = *id;
                    }
                }
            }
        }

        match item {
            TableItem::File => {
                if let Some(dir) = self.directories.get(&current) {
                    if let Some(id) = dir.files.iter().find(|id| {
                        if let Some(file) = self.files.get(*id) {
                            file.name == parts.clone().last().unwrap()
                        } else {
                            false
                        }
                    }) {
                        return Some(PathResult::File(*id));
                    }
                }
            }
            TableItem::Directory => {
                if let Some(dir) = self.directories.get(&current) {
                    if current.is_nil() {
                        return Some(PathResult::Directory(current));
                    }

                    let dir_name = parts.clone().last()?;
                    if dir.name == dir_name {
                        return Some(PathResult::Directory(current));
                    }
                    if let Some(id) = dir.directories.iter().find(|id| {
                        if let Some(directory) = self.directories.get(*id) {
                            directory.name == dir_name
                        } else {
                            false
                        }
                    }) {
                        return Some(PathResult::Directory(*id));
                    }
                }
            }
        }
        None
    }

    /// Remove an item from the file table
    pub fn remove(&mut self, path: &str) -> Option<()> {
        let parts = path.split('/').filter(|p| !p.is_empty());
        let mut current = Uuid::nil();
        for part in parts.clone() {
            if let Some(dir) = self.directories.get(&current) {
                if let Some(id) = dir.directories.iter().find(|id| {
                    if let Some(directory) = self.directories.get(*id) {
                        directory.name == part
                    } else {
                        false
                    }
                }) {
                    current = *id;
                }
            }
        }
        if let Some(dir) = self.directories.get(&current).cloned() {
            if let Some(id) = dir.files.iter().find(|id| {
                if let Some(file) = self.files.get(*id) {
                    file.name == parts.clone().last().unwrap()
                } else {
                    false
                }
            }) {
                self.files.remove(id);
                if let Some(dir) = self.directories.get_mut(&current) {
                    dir.files.retain(|f| f != id);
                }
                return Some(());
            }
        }
        None
    }
}

/// Get current time from the system
fn get_time() -> u64 {
    use web_time::{SystemTime, UNIX_EPOCH};
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_secs()
}
