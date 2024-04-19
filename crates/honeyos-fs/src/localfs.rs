use hashbrown::HashMap;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::{
    filetable::{FileTable, PathResult, TableItem},
    fshandler::FsHandler,
};

/// The file data table for the local file system
#[derive(Debug, Serialize, Deserialize)]
pub struct LocalFsFileDataTable(HashMap<Uuid, Vec<u8>>);

/// The file system habdler for the local file system
pub struct LocalFsHandler;

impl FsHandler for LocalFsHandler {
    fn read_file_table(&mut self) -> FileTable {
        let window = web_sys::window().unwrap();
        let storage = window.local_storage().unwrap().unwrap();
        if let Some(data) = storage.get_item("file_table").unwrap() {
            log::info!("Reading file table from storage: {}", data);
            let file_table: FileTable = serde_json::from_str(&data).unwrap();
            return file_table;
        }
        log::info!("Creating new file table");
        // If the file table does not exist, create a new one
        let file_table = FileTable::new();
        storage
            .set_item("file_table", &serde_json::to_string(&file_table).unwrap())
            .unwrap();
        file_table
    }

    fn write_file_table(&mut self, file_table: &FileTable) {
        let window = web_sys::window().unwrap();
        let storage = window.local_storage().unwrap().unwrap();
        storage
            .set_item("file_table", &serde_json::to_string(file_table).unwrap())
            .unwrap();
    }

    fn read(&mut self, path: &str) -> Option<Vec<u8>> {
        let file_table = self.read_file_table();
        let entry = file_table.get(path, TableItem::File)?;
        if let PathResult::File(file) = entry {
            if let Some(data) = get_local_fs_data_table().0.get(&file) {
                return Some(data.clone());
            } else {
                return Some(Vec::new());
            }
        }
        None
    }

    fn write(&mut self, path: &str, content: &[u8]) -> Option<()> {
        let file_table = self.read_file_table();
        let entry = file_table.get(path, TableItem::File)?;
        if let PathResult::File(file) = entry {
            let mut file_data_table = get_local_fs_data_table();
            file_data_table.0.insert(file, content.to_vec());
            write_local_fs_data_table(&file_data_table);
            return Some(());
        }
        None
    }

    fn mkdir(&mut self, path: &str) -> Option<()> {
        let file_table = self.read_file_table();
        // Check if the directory already exists
        if file_table.get(path, TableItem::Directory).is_some() {
            return None;
        }
        let mut file_table = file_table;
        file_table.create(path, TableItem::Directory).unwrap();
        self.write_file_table(&file_table);
        Some(())
    }

    fn touch(&mut self, path: &str) -> Option<()> {
        // Check if the file already exists
        if self.exists(path) {
            return None;
        }
        let file_table = self.read_file_table();
        let mut file_table = file_table;
        file_table.create(path, TableItem::File)?;
        self.write_file_table(&file_table);
        Some(())
    }

    fn rm(&mut self, path: &str) -> Option<()> {
        let file_table = self.read_file_table();
        let mut file_table = file_table;
        file_table.remove(path)?;
        self.write_file_table(&file_table);
        Some(())
    }

    fn rmdir(&mut self, path: &str) -> Option<()> {
        let file_table = self.read_file_table();
        let mut file_table = file_table;
        file_table.remove(path)?;
        self.write_file_table(&file_table);
        Some(())
    }

    fn ls(&mut self, path: &str) -> Option<Vec<String>> {
        let file_table = self.read_file_table();
        let entry = file_table.get(path, TableItem::Directory)?;
        if let PathResult::Directory(dir) = entry {
            let dir = file_table.directories.get(&dir)?;
            let files = dir.files.clone();
            let dirs = dir.directories.clone();
            let mut result = Vec::new();
            for file in files.iter() {
                let file = file_table.files.get(file)?;
                result.push(file.name.clone());
            }
            for dir in dirs.iter() {
                let dir = file_table.directories.get(dir)?;
                result.push(dir.name.clone());
            }
            return Some(result);
        }
        None
    }

    /// Copy a file
    fn cp(&mut self, from: &str, to: &str) -> Option<()> {
        let file_table = self.read_file_table();
        let entry = file_table.get(from, TableItem::File)?;
        if let PathResult::File(file) = entry {
            let data_table = get_local_fs_data_table();
            let data = data_table.0.get(&file)?.clone();
            let mut file_table = file_table;
            let new_file = file_table.create(to, TableItem::File)?;
            let mut data_table = get_local_fs_data_table();
            data_table.0.insert(new_file, data);
            write_local_fs_data_table(&data_table);
            self.write_file_table(&file_table);
            return Some(());
        }
        None
    }

    /// Move a file
    fn mv(&mut self, from: &str, to: &str) -> Option<()> {
        let mut file_table = self.read_file_table();
        let entry = file_table.get(from, TableItem::File)?;
        if let PathResult::File(file) = entry {
            let data_table = get_local_fs_data_table();
            let data = data_table.0.get(&file)?.clone();
            let new_file = file_table.create(to, TableItem::File)?;
            let mut data_table = get_local_fs_data_table();
            data_table.0.insert(new_file, data);
            write_local_fs_data_table(&data_table);
            file_table.remove(from)?;
            self.write_file_table(&file_table);
            return Some(());
        }
        None
    }

    fn exists(&mut self, path: &str) -> bool {
        let file_table = self.read_file_table();
        file_table.get(path, TableItem::File).is_some()
            || file_table.get(path, TableItem::Directory).is_some()
    }

    fn is_dir(&mut self, path: &str) -> bool {
        let file_table = self.read_file_table();
        file_table.get(path, TableItem::Directory).is_some()
    }

    fn is_file(&mut self, path: &str) -> bool {
        let file_table = self.read_file_table();
        file_table.get(path, TableItem::File).is_some()
    }
}

/// Get the data table for the local file system
/// If the data table does not exist, create a new one
fn get_local_fs_data_table() -> LocalFsFileDataTable {
    let window = web_sys::window().unwrap();
    let storage = window.local_storage().unwrap().unwrap();
    if let Some(data) = storage.get_item("file_data_table").unwrap() {
        let file_data_table: LocalFsFileDataTable = serde_json::from_str(&data).unwrap();
        return file_data_table;
    }
    // If the file data table does not exist, create a new one
    let file_data_table = LocalFsFileDataTable(HashMap::new());
    storage
        .set_item(
            "file_data_table",
            &serde_json::to_string(&file_data_table).unwrap(),
        )
        .unwrap();
    file_data_table
}

/// Write the data table for the local file system
fn write_local_fs_data_table(file_data_table: &LocalFsFileDataTable) {
    let window = web_sys::window().unwrap();
    let storage = window.local_storage().unwrap().unwrap();
    storage
        .set_item(
            "file_data_table",
            &serde_json::to_string(file_data_table).unwrap(),
        )
        .unwrap();
}
