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
    requirements::{self, WasmRequirements},
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
            if let Err(e) =
                thread_executor(id, wasm_bin, running.clone(), stdout, api_builder).await
            {
                log::error!("Failed to execute process {}: {}", id, e);
                running.store(false, Ordering::Relaxed);
            }
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
    let requirements = WasmRequirements::parse(&wasm_bin)?;

    let memory = Arc::new(Memory::new(
        requirements.initial_memory,
        requirements.maximum_memory,
        requirements.shared_memory,
    )?);
    let table = Arc::new(setup_table()?);

    let api_ctx = Arc::new(ApiModuleCtx::new(
        id,
        memory.clone(),
        table.clone(),
        stdout.clone(),
    ));
    let api_module = ApiModuleCtx::js_from_fn(api_builder, api_ctx);

    let environment = setup_environment(&memory, &table)?;
    let imports = setup_imports(environment, api_module)?;

    let instance = init_binary(&wasm_bin, imports).await;
    exec_instance(instance)?;

    // Tell the process manager the process has stopped
    running.store(false, Ordering::Relaxed);
    Ok(())
}

/// Setup table
fn setup_table() -> anyhow::Result<WebAssembly::Table> {
    const INITIAL: u32 = 4;
    const ELEMENT: &str = "anyfunc";

    let table_desc = JSON::parse("{}").unwrap();
    Reflect::set(&table_desc, &"initial".into(), &INITIAL.into())
        .map_err(|e| anyhow!("Failed to setup table: {:?}", e))?;
    Reflect::set(&table_desc, &"element".into(), &ELEMENT.into())
        .map_err(|e| anyhow!("Failed to setup table: {:?}", e))?;
    WebAssembly::Table::new(&table_desc.unchecked_into())
        .map_err(|e| anyhow!("Failed to setup table: {:?}", e))
}

/// Setup the env
fn setup_environment(memory: &Memory, table: &WebAssembly::Table) -> anyhow::Result<JsValue> {
    let env = JSON::parse("{}").unwrap();
    Reflect::set(&env, &"memory".into(), memory.inner())
        .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(&env, &"table".into(), &table)
        .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;

    setup_emscripten_environment(&env)?;
    Ok(env)
}

/// Setup the imports object
fn setup_imports(environment: JsValue, api_module: JsValue) -> anyhow::Result<JsValue> {
    let imports_object = JSON::parse("{}").unwrap();
    Reflect::set(&imports_object, &"env".into(), &environment)
        .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(&imports_object, &"hapi".into(), &api_module)
        .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;

    // This does nothing. But emscripten expects this to be there. This might be removed in the future
    setup_emscripten_imports(&imports_object)?;
    Ok(imports_object)
}

/// Add dummy methods to the env for emscripten suppoort.
/// These methods remain unimplemented as they are not needed, but emscripten still expects them
fn setup_emscripten_environment(env: &JsValue) -> anyhow::Result<()> {
    Reflect::set(
        &env,
        &"emscripten_notify_memory_growth".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"_emscripten_notify_mailbox_postmessage".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"emscripten_check_blocking_allowed".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"_emscripten_notify_mailbox_postmessage".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"_emscripten_receive_on_main_thread_js".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"__emscripten_init_main_thread_js".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"_emscripten_thread_mailbox_await".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"_emscripten_thread_set_strongref".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"emscripten_exit_with_live_runtime".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;
    Reflect::set(
        &env,
        &"__emscripten_thread_cleanup".into(),
        &Function::new_no_args("{}"),
    )
    .map_err(|e| anyhow!("Failed to setup env: {:?}", e))?;

    Ok(())
}

/// Add dummy methods to the import for emscripten suppoort.
/// These methods remain unimplemented as they are not needed, but emscripten still expects them
fn setup_emscripten_imports(imports_object: &JsValue) -> anyhow::Result<()> {
    let wasi_snapshot_preview1 = JSON::parse("{}").unwrap();
    Reflect::set(
        &wasi_snapshot_preview1,
        &"proc_exit".into(),
        &Function::new_no_args("{}").into(),
    )
    .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(
        &wasi_snapshot_preview1,
        &"clock_time_get".into(),
        &Function::new_no_args("{}").into(),
    )
    .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(
        &wasi_snapshot_preview1,
        &"fd_close".into(),
        &Function::new_no_args("{}").into(),
    )
    .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(
        &wasi_snapshot_preview1,
        &"fd_write".into(),
        &Function::new_no_args("{}").into(),
    )
    .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(
        &wasi_snapshot_preview1,
        &"fd_seek".into(),
        &Function::new_no_args("{}").into(),
    )
    .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Reflect::set(
        &imports_object,
        &"wasi_snapshot_preview1".into(),
        &wasi_snapshot_preview1,
    )
    .map_err(|e| anyhow::anyhow!("Failed to setup imports: {:?}", e))?;
    Ok(())
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
