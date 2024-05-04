use anyhow::anyhow;
use std::sync::{
    atomic::{AtomicBool, Ordering},
    Arc, Mutex,
};
use uuid::Uuid;
use wasm_bindgen::{JsCast, JsValue};
use wasm_bindgen_futures::JsFuture;
use wasm_thread::JoinHandle;
use web_sys::js_sys::{Function, Reflect, WebAssembly, JSON};

use crate::{
    api::{ApiBuilderFn, ApiModuleCtx},
    memory::Memory,
    stdout::{ProcessStdOut, StdoutMessage},
};

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
    stdout: ProcessStdOut,
}

impl Process {
    /// Create a process
    pub fn new(id: Uuid, wasm_bin: Vec<u8>, title: String, api_builder: ApiBuilderFn) -> Self {
        // The running flag
        let running = Arc::new(AtomicBool::new(true));
        let running_thread = running.clone(); // The reference to the running flag sent to the process thread

        // The stdout
        let stdout = ProcessStdOut::new();
        let stdout_thread = stdout.process_buffer();

        // The execution thread
        let handle = wasm_thread::spawn_async(async move || {
            // Youd think there was a cleaner way to do this. But the borrow checker will not sit still unless I do this.
            let id = id;
            let wasm_bin = wasm_bin.clone();
            let running = running_thread.clone();
            let stdout = stdout_thread.clone();
            thread_executor(id, wasm_bin, running, stdout, api_builder)
                .await
                .unwrap();
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

    /// Check if the process is still running
    pub fn is_running(&self) -> bool {
        self.running.load(Ordering::Relaxed)
    }

    /// Get the stdout
    pub fn stdout(&self) -> &ProcessStdOut {
        &self.stdout
    }

    /// Get the stdout
    pub fn stdout_mut(&mut self) -> &mut ProcessStdOut {
        &mut self.stdout
    }
}

/// The thread executor
async fn thread_executor(
    id: Uuid,
    wasm_bin: Vec<u8>,
    running: Arc<AtomicBool>,
    stdout: Arc<Mutex<Vec<StdoutMessage>>>,
    api_builder: ApiBuilderFn,
) -> anyhow::Result<()> {
    let memory = Arc::new(Memory::new()?);

    let api_ctx = Arc::new(ApiModuleCtx::new(id, memory.clone(), stdout.clone()));
    let api_module = ApiModuleCtx::js_from_fn(api_builder, api_ctx);

    let environment = setup_environment(&memory)?;
    let imports = setup_imports(environment, api_module)?;

    let instance = init_binary(&wasm_bin, imports).await;
    exec_instance(instance)?;

    // Tell the process manager the process has stopped
    running.store(false, Ordering::Relaxed);
    Ok(())
}

/// Setup the env
fn setup_environment(memory: &Memory) -> anyhow::Result<JsValue> {
    let env = JSON::parse("{}").unwrap();
    Reflect::set(&env, &"memory".into(), memory.inner())
        .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Ok(env)
}

/// Setup the imports object
fn setup_imports(environment: JsValue, api_module: JsValue) -> anyhow::Result<JsValue> {
    let imports_object = JSON::parse("{}").unwrap();
    Reflect::set(&imports_object, &"env".into(), &environment)
        .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(&imports_object, &"hapi".into(), &api_module)
        .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Ok(imports_object)
}

/// Initialize the wasm instance
async fn init_binary(bin: &[u8], imports: JsValue) -> WebAssembly::Instance {
    let promise = WebAssembly::instantiate_buffer(bin, &imports.unchecked_into());
    let promise = JsFuture::from(promise);
    let instance = promise.await.unwrap();

    Reflect::get(&instance, &"instance".into())
        .unwrap()
        .dyn_into()
        .unwrap()
}

/// Execute the binary by calling its entrypoint.
/// The entrypoint is the _start method
fn exec_instance(instance: WebAssembly::Instance) -> anyhow::Result<()> {
    let exports = instance.exports();

    let entrypoint: Function = Reflect::get(&exports, &"_start".into())
        .map_err(|_| {
            anyhow::anyhow!("Could not execute binary, no entrypoint named `_start` found")
        })?
        .dyn_into()
        .map_err(|_| {
            anyhow::anyhow!("Could not execute binary, Entrypoint `_start` must be a function.")
        })?;
    drop(exports);

    entrypoint
        .call0(&JsValue::undefined())
        .map_err(|e| anyhow::anyhow!("Failed to execute `_start` function: {:?}", e))?;
    Ok(())
}
