use uuid::Uuid;

/// The context handle sent to the process therad
#[derive(Debug)]
pub struct ProcessContext {
    id: Uuid,
    // Keeps track if the process is still running
    pub running: bool,
}

impl ProcessContext {
    /// Construct a new process context
    pub fn new(id: Uuid) -> Self {
        Self { id, running: true }
    }

    /// Get the id
    pub fn id(&self) -> Uuid {
        self.id
    }
}

unsafe impl Send for ProcessContext {}
unsafe impl Sync for ProcessContext {}
