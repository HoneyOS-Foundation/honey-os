#![feature(async_closure)]

use std::sync::{Arc, Mutex, MutexGuard, Once};

use api::ApiBuilderFn;
use hashbrown::{
    hash_map::{Values, ValuesMut},
    HashMap,
};
use process::Process;
use uuid::Uuid;

pub mod api;
pub mod context;
pub mod memory;
pub mod process;
pub mod requirements;
pub mod stdout;

static mut PROCESS_MANAGER: Option<Arc<Mutex<ProcessManager>>> = None;

/// A manager for the seperate processes in honeyos
#[derive(Debug)]
pub struct ProcessManager {
    api_builder: ApiBuilderFn,
    processes: HashMap<Uuid, Process>,
}

impl ProcessManager {
    /// Initialize the process manager.
    /// Should only be called once.
    pub fn init_once(api_builder: ApiBuilderFn) {
        static SET_HOOK: Once = Once::new();
        SET_HOOK.call_once(|| unsafe {
            PROCESS_MANAGER = Some(Arc::new(Mutex::new(ProcessManager {
                api_builder,
                processes: HashMap::new(),
            })));
        });
    }

    /// Get the static instance
    pub fn get<'a>() -> Option<MutexGuard<'a, ProcessManager>> {
        let pm = unsafe {
            PROCESS_MANAGER
                .as_ref()
                .expect("Process manager has not been initialized")
        };
        pm.try_lock().ok()
    }

    /// Get the static instance.
    /// Blocks until locked.
    pub fn blocking_get<'a>() -> MutexGuard<'a, Self> {
        let pm = unsafe {
            PROCESS_MANAGER
                .as_ref()
                .expect("Display server not initialized")
        };
        loop {
            if let Ok(pm) = pm.try_lock() {
                return pm;
            }
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
        self.processes
            .insert(id, Process::new(id, wasm_bin, title, self.api_builder));
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
    pub fn process(&self, id: Uuid) -> Option<&Process> {
        self.processes.get(&id)
    }

    /// Get a process
    pub fn process_mut(&mut self, id: Uuid) -> Option<&mut Process> {
        self.processes.get_mut(&id)
    }
}
