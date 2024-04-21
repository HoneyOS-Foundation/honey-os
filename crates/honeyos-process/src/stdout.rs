/// StdOut is a struct that represents a standard output stream of a shell
#[derive(Default, Debug, Clone)]
pub struct ProcessStdOut {
    /// The output buffer
    buffer: String,
}

impl ProcessStdOut {
    /// Create a new StdOut instance
    pub fn new() -> Self {
        Self {
            buffer: String::new(),
        }
    }

    /// Write a string to the output buffer
    pub fn write(&mut self, string: impl Into<String>) {
        let string = string.into();
        self.buffer.push_str(&string);
    }

    /// Write a line to the output buffer
    pub fn writeln(&mut self, string: impl Into<String>) {
        let string = string.into();
        self.buffer.push_str(&string);
        self.buffer.push('\n');
    }

    /// Clear the output buffer
    pub fn clear(&mut self) {
        self.buffer.clear();
    }

    /// Get the output buffer
    pub fn buffer(&self) -> String {
        self.buffer.clone()
    }
}
