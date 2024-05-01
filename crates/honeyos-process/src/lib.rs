#![feature(async_closure)]

use hashbrown::hash_map::{Values, ValuesMut};
use process::Process;
use uuid::Uuid;
use wasm_bindgen::{closure::Closure, JsValue};

pub mod context;
pub mod process;
pub mod stdout;

/// A manager for the seperate processes in honeyos
#[derive(Debug)]
pub struct ProcessManager {
    processes: hashbrown::HashMap<Uuid, Process>,
}

impl ProcessManager {
    /// Create the process manager
    pub fn new() -> Self {
        Self {
            processes: Default::default(),
        }
    }

    /// Spawn a process
    pub fn spawn(&mut self, wasm_bin: Vec<u8>, title: Option<String>) -> Uuid {
        let id = Uuid::new_v4();
        let title = if let Some(title) = title {
            title
        } else {
            id.to_string()
        };
        self.processes.insert(id, Process::new(wasm_bin, title));
        id
    }

    /// Check for the status of each process and remove those no longer running
    pub fn update(&mut self) {
        let mut closed = Vec::new();
        for (id, process) in self.processes.iter_mut() {
            if !process.is_running() {
                closed.push(*id);
            }
        }
        for id in closed {
            self.processes.remove(&id);
        }
    }

    /// Get all the processes
    pub fn processes(&self) -> Values<Uuid, Process> {
        self.processes.values()
    }

    /// Get all the processes
    pub fn processes_mut(&mut self) -> ValuesMut<Uuid, Process> {
        self.processes.values_mut()
    }

    /// Get a process
    pub fn get(&self, id: Uuid) -> Option<&Process> {
        self.processes.get(&id)
    }

    /// Get a process
    pub fn get_mut(&mut self, id: Uuid) -> Option<&mut Process> {
        self.processes.get_mut(&id)
    }
}
