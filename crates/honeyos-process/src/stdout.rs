use anyhow::anyhow;
use std::sync::{Arc, Mutex};

/// A message sent to stdout
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum StdoutMessage {
    String(String),
    Clear,
    ClearLine,
}

/// StdOut is a struct that represents a standard output stream of a shell
#[derive(Debug)]
pub struct ProcessStdOut {
    process_buffer: Arc<Mutex<Vec<StdoutMessage>>>, // The process-side buffer
    eventual_buffer: String,                        // The eventual buffer
}

impl ProcessStdOut {
    /// Create a new StdOut instance
    pub fn new() -> Self {
        Self {
            process_buffer: Arc::new(Mutex::new(Vec::new())),
            eventual_buffer: String::new(),
        }
    }

    /// Write a string to the kernel buffer. Locks the buffer
    pub fn write(&mut self, string: impl Into<String>) -> anyhow::Result<()> {
        let string = string.into();
        let mut process_buffer = self
            .process_buffer
            .lock()
            .map_err(|e| anyhow!("Failed to lock stdout buffer: {}", e))?;
        process_buffer.push(StdoutMessage::String(string));
        Ok(())
    }

    /// Write a line to the kernel buffer
    pub fn writeln(&mut self, string: impl Into<String>) -> anyhow::Result<()> {
        let string = string.into();
        let string = format!("{}\n", string);
        let mut process_buffer = self
            .process_buffer
            .lock()
            .map_err(|e| anyhow!("Failed to lock stdout buffer: {}", e))?;
        process_buffer.push(StdoutMessage::String(string));
        Ok(())
    }

    /// Sync buffer to the local copy
    pub fn sync(&mut self) {
        if let Ok(mut process_buffer) = self.process_buffer.try_lock() {
            for message in process_buffer.iter() {
                match message {
                    StdoutMessage::String(s) => {
                        self.eventual_buffer = format!("{}{}", self.eventual_buffer, &s)
                    }
                    StdoutMessage::Clear => self.eventual_buffer.clear(),
                    // Clear the last line
                    StdoutMessage::ClearLine => {
                        let mut lines = self
                            .eventual_buffer
                            .split("\n")
                            .filter(|c| *c != "")
                            .collect::<Vec<&str>>();
                        lines.remove(lines.len() - 1);
                        let mut result = String::new();
                        for line in lines {
                            result = format!("{}{}\n", result, line);
                        }
                        self.eventual_buffer = result;
                    }
                }
            }
            process_buffer.clear();
        }
    }

    /// Clear the local buffer
    pub fn clear(&mut self) {
        self.eventual_buffer.clear();
    }

    /// Return the local buffer
    pub fn buffer(&self) -> String {
        self.eventual_buffer.clone()
    }

    /// Return an arc reference to the process buffer
    pub fn process_buffer(&self) -> Arc<Mutex<Vec<StdoutMessage>>> {
        self.process_buffer.clone()
    }
}
