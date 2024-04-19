use crate::filetable::FileTable;

/// Filesystem handler trait
pub trait FsHandler {
    /// Get the file table
    fn read_file_table(&mut self) -> FileTable;

    /// Write the file table
    fn write_file_table(&mut self, file_table: &FileTable);

    /// Read a file
    fn read(&mut self, path: &str) -> Option<Vec<u8>>;

    /// Write to a file
    fn write(&mut self, path: &str, content: &[u8]) -> Option<()>;

    /// Create a directory
    fn mkdir(&mut self, path: &str) -> Option<()>;

    /// Create a file
    fn touch(&mut self, path: &str) -> Option<()>;

    /// Remove a file
    fn rm(&mut self, path: &str) -> Option<()>;

    /// Remove a directory
    fn rmdir(&mut self, path: &str) -> Option<()>;

    /// Find the list of files in a directory
    fn ls(&mut self, path: &str) -> Option<Vec<String>>;

    /// Copy a file
    fn cp(&mut self, from: &str, to: &str) -> Option<()>;

    /// Move a file
    fn mv(&mut self, from: &str, to: &str) -> Option<()>;

    /// Check if a file exists
    fn exists(&mut self, path: &str) -> bool;

    /// Check if a path is a directory
    fn is_dir(&mut self, path: &str) -> bool;

    /// Check if a path is a file
    fn is_file(&mut self, path: &str) -> bool;
}
