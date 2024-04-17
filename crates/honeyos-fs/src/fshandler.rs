use crate::filetable::FileTable;

/// Filesystem handler trait
pub trait FsHandler {
    /// Get the file table
    fn read_file_table(&self) -> FileTable;

    /// Write the file table
    fn write_file_table(&self, file_table: &FileTable);

    /// Read a file
    fn read(&self, path: &str) -> Option<Vec<u8>>;

    /// Write to a file
    fn write(&self, path: &str, content: &[u8]) -> Option<()>;

    /// Create a directory
    fn mkdir(&self, path: &str) -> Option<()>;

    /// Create a file
    fn touch(&self, path: &str) -> Option<()>;

    /// Remove a file
    fn rm(&self, path: &str) -> Option<()>;

    /// Remove a directory
    fn rmdir(&self, path: &str) -> Option<()>;

    /// Find the list of files in a directory
    fn ls(&self, path: &str) -> Option<Vec<String>>;

    /// Copy a file
    fn cp(&self, from: &str, to: &str) -> Option<()>;

    /// Move a file
    fn mv(&self, from: &str, to: &str) -> Option<()>;

    /// Check if a file exists
    fn exists(&self, path: &str) -> bool;

    /// Check if a path is a directory
    fn is_dir(&self, path: &str) -> bool;

    /// Check if a path is a file
    fn is_file(&self, path: &str) -> bool;
}
