use std::{
    sync::{
        atomic::{AtomicBool, Ordering},
        Arc, Mutex,
    },
    time::Duration,
};
use uuid::Uuid;
use wasm_bindgen::{closure::Closure, JsCast, JsValue};
use wasm_bindgen_futures::JsFuture;
use wasm_thread::JoinHandle;
use web_sys::js_sys::{Function, Reflect, WebAssembly, JSON};

use crate::stdout::{self, ProcessStdOut};

/// A process in honeyos
#[derive(Debug)]
pub struct Process {
    // The process id
    id: Uuid,
    // The process title
    title: String,

    // The thread handle
    _handle: JoinHandle<()>,

    // Flag for if the process is still running
    running: Arc<AtomicBool>,

    // The stdout
    stdout: Arc<Mutex<ProcessStdOut>>,
}

impl Process {
    /// Create a process
    pub fn new(wasm_bin: Vec<u8>, title: String) -> Self {
        let id = Uuid::new_v4();

        // The running flag
        let running = Arc::new(AtomicBool::new(true));
        let running_thread = running.clone(); // The reference to the running flag sent to the process thread

        // The stdout
        let stdout = Arc::new(Mutex::new(ProcessStdOut::new()));
        let stdout_thread = stdout.clone();

        // The execution thread
        let handle = wasm_thread::spawn_async(async move || {
            // Youd think there was a cleaner way to do this. But the borrow checker will not sit still unless I do this.
            let id = id;
            let wasm_bin = wasm_bin.clone();
            let running = running_thread.clone();
            let stdout = stdout_thread.clone();
            thread_executor(id, wasm_bin, running, stdout).await;
        });

        Self {
            id,
            title,
            running,
            stdout,
            _handle: handle,
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

    /// Get the stdout output.
    /// Also clears the buffer.
    pub fn stdout(&mut self) -> Option<String> {
        let Ok(mut stdout) = self.stdout.try_lock() else {
            return None;
        };
        let result = stdout.buffer().clone();
        stdout.clear();
        Some(result)
    }

    /// Check if the process is still running
    pub fn is_running(&self) -> bool {
        self.running.load(Ordering::Relaxed)
    }
}

/// The thread executor
async fn thread_executor(
    id: Uuid,
    wasm_bin: Vec<u8>,
    running: Arc<AtomicBool>,
    stdout: Arc<Mutex<ProcessStdOut>>,
) {
    // The println method:
    let stdout_f = stdout.clone();
    let println_f = Closure::<dyn Fn(u32)>::new(move |i: u32| loop {
        if let Ok(mut stdout) = stdout_f.try_lock() {
            stdout.writeln(format!("{} - Hello, world! From wasm process: {}", i, id));
            log::info!("{} - Hello, world! From wasm process: {}", i, id);
            break;
        }
        wasm_thread::sleep(Duration::from_millis(100));
    })
    .into_js_value();

    let imports = JSON::parse("{}").unwrap();
    Reflect::set(&imports, &"println".into(), &println_f).unwrap();

    let imports_object = JSON::parse("{}").unwrap();
    Reflect::set(&imports_object, &"hapi".into(), &imports).unwrap();

    let promise = WebAssembly::instantiate_buffer(&wasm_bin, &imports_object.unchecked_into());
    let promise = JsFuture::from(promise);
    let instance = promise.await.unwrap();

    let instance: WebAssembly::Instance = Reflect::get(&instance, &"instance".into())
        .unwrap()
        .dyn_into()
        .unwrap();

    // The entrypoint is the _start method
    let exports = instance.exports();
    let entrypoint: Function = Reflect::get(exports.as_ref(), &"_start".into())
        .expect("Could not execute binary, no entrypoint named `_start` foind")
        .dyn_into()
        .expect("Could not execute binary, Entrypoint `_start` must be a function");

    entrypoint
        .call0(&JsValue::undefined())
        .map_err(|e| anyhow::anyhow!("Failed to execute `_start` function: {:?}", e))
        .unwrap();

    // Tell the process manager the process has stopped
    running.store(false, Ordering::Relaxed);
}
