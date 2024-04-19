use uuid::Uuid;

use crate::{
    filetable::{FileTable, PathResult, TableItem},
    fshandler::FsHandler,
};

/// The file system handler for the ram file system
#[derive(Debug)]
pub struct RamFsHandler {
    file_table: FileTable,
    data_table: hashbrown::HashMap<Uuid, Vec<u8>>,
}

impl RamFsHandler {
    /// Create a new ram file system handler
    pub fn new() -> Self {
        Self {
            file_table: FileTable::new(),
            data_table: hashbrown::HashMap::new(),
        }
    }
}

impl FsHandler for RamFsHandler {
    fn read_file_table(&mut self) -> FileTable {
        self.file_table.clone()
    }

    fn write_file_table(&mut self, file_table: &FileTable) {
        self.file_table = file_table.clone();
    }

    fn read(&mut self, path: &str) -> Option<Vec<u8>> {
        let entry = self.file_table.get(path, TableItem::File)?;
        if let PathResult::File(file) = entry {
            if let Some(data) = self.data_table.get(&file) {
                return Some(data.clone());
            } else {
                return Some(Vec::new());
            }
        }
        None
    }

    fn write(&mut self, path: &str, content: &[u8]) -> Option<()> {
        let entry = self.file_table.get(path, TableItem::File)?;
        if let PathResult::File(file) = entry {
            self.data_table.insert(file, content.to_vec());
            return Some(());
        }
        None
    }

    fn mkdir(&mut self, path: &str) -> Option<()> {
        if self.exists(path) {
            return None;
        }
        let _ = self.file_table.create(path, TableItem::Directory)?;
        Some(())
    }

    fn touch(&mut self, path: &str) -> Option<()> {
        if self.exists(path) {
            return None;
        }

        let _ = self.file_table.create(path, TableItem::File)?;
        Some(())
    }

    fn rm(&mut self, path: &str) -> Option<()> {
        let entry = self.file_table.get(path, TableItem::File)?;
        if let PathResult::File(file) = entry {
            self.file_table.remove(path)?;
            self.data_table.remove(&file);
            return Some(());
        }
        None
    }

    fn rmdir(&mut self, path: &str) -> Option<()> {
        let entry = self.file_table.get(path, TableItem::Directory)?;
        if let PathResult::Directory(_) = entry {
            self.file_table.remove(path)?;
            self.data_table.retain(|_, v| !v.is_empty());
            return Some(());
        }
        None
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

    fn cp(&mut self, from: &str, to: &str) -> Option<()> {
        let data = self.read(from)?;
        self.write(to, &data)?;
        Some(())
    }

    fn mv(&mut self, from: &str, to: &str) -> Option<()> {
        let data = self.read(from)?;
        self.write(to, &data)?;
        self.rm(from)?;
        Some(())
    }

    fn exists(&mut self, path: &str) -> bool {
        let entry = self.file_table.get(path, TableItem::File);
        if entry.is_some() {
            return true;
        }
        let entry = self.file_table.get(path, TableItem::Directory);
        entry.is_some()
    }

    fn is_dir(&mut self, path: &str) -> bool {
        let entry = self.file_table.get(path, TableItem::Directory);
        entry.is_some()
    }

    fn is_file(&mut self, path: &str) -> bool {
        let entry = self.file_table.get(path, TableItem::File);
        entry.is_some()
    }
}
