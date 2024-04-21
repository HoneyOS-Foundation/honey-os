use std::{
    borrow::Borrow,
    sync::{Arc, Mutex},
    time::Duration,
};

use uuid::Uuid;
use wasm_thread::JoinHandle;
use web_sys::{Document, Element};

use crate::stdout::ProcessStdOut;

/// The context handle sent to the process therad
#[derive(Debug)]
pub struct ProcessContext {
    // The display element
    pub display: Option<Element>,
    // Keeps track if the process is still running
    pub running: bool,
}

unsafe impl Send for ProcessContext {}
unsafe impl Sync for ProcessContext {}

/// A process in honeyos
#[derive(Debug)]
pub struct Process {
    // The process id
    id: Uuid,
    // The process title
    title: String,

    // The stdout for a process
    stdout: Arc<Mutex<ProcessStdOut>>,
    // The process context
    context: Arc<Mutex<ProcessContext>>,

    // The join handle
    handle: JoinHandle<()>,
}

impl Process {
    /// Create a process
    pub fn new(wasm_bin: Vec<u8>, title: String, display: Option<Element>) -> Self {
        let id = Uuid::new_v4();
        log::info!("Creating process: {}", id);
        let stdout = Arc::new(Mutex::new(ProcessStdOut::new()));
        let stdout_thread = stdout.clone();

        // Initialize the context
        let context = Arc::new(Mutex::new(ProcessContext {
            display,
            running: true,
        }));
        let context_thread = context.clone();

        // Spawns the process thread
        log::info!("Spawing thread");
        let handle = wasm_thread::spawn(move || {
            // wasm_bindgen_futures::spawn_local(async move {
            log::info!("Thread entered");
            // let bin = wasm_bin.clone();
            let stdout = stdout_thread.clone();

            // Wait until the context lock can be taken, then inform the manager the process has been stopped
            'lock: loop {
                if let Ok(mut ctx) = context_thread.try_lock() {
                    for _ in 0..10 {
                        log::info!("Hi from: {}", id);
                        if let Ok(mut stdout) = stdout.try_lock() {
                            stdout.writeln(format!("Hello from {}!", id));
                        }
                        wasm_thread::sleep(Duration::from_secs(1));
                    }
                    ctx.running = false;
                    break 'lock;
                }
            }
            // });
        });
        log::info!("Process created: {}", id);
        Self {
            id,
            title,
            stdout,
            context,
            handle,
        }
    }

    /// Get the id
    pub fn id(&self) -> Uuid {
        self.id
    }

    /// Get the title
    pub fn title(&self) -> &str {
        &self.title
    }

    /// Get the stdout output
    pub fn stdout(&self) -> String {
        let stdout = self.stdout.lock().unwrap();
        stdout.buffer().clone()
    }

    /// Clear the stdout
    pub fn clear_stdout(&mut self) {
        let mut stdout = self.stdout.lock().unwrap();
        stdout.clear();
    }

    /// Check if the process is still running
    pub fn is_running(&self) -> bool {
        if let Ok(ctx) = self.context.try_lock() {
            return ctx.running;
        }
        true
    }
}
