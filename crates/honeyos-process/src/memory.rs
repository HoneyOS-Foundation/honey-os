use anyhow::anyhow;
use wasm_bindgen::JsCast;
use web_sys::js_sys::{Reflect, Uint8Array, WebAssembly, JSON};

const INITIAL_MEMORY: u32 = 18;
const MAXIMUM_MEMORY: u32 = 16384;

/// The sandboxed memory of a process
#[derive(Debug)]
pub struct Memory {
    inner: WebAssembly::Memory,
}

impl Memory {
    pub fn new() -> anyhow::Result<Self> {
        let memory_desc = JSON::parse("{}").unwrap();
        Reflect::set(&memory_desc, &"initial".into(), &INITIAL_MEMORY.into()).unwrap();
        Reflect::set(&memory_desc, &"maximum".into(), &MAXIMUM_MEMORY.into()).unwrap();
        Reflect::set(&memory_desc, &"shared".into(), &true.into()).unwrap();

        let inner = WebAssembly::Memory::new(memory_desc.unchecked_ref())
            .map_err(|e| anyhow!("Failed to allocate memory for process: {:?}", e))?;

        Ok(Self { inner })
    }

    /// Read from a certain block of memory
    pub fn read(&self, ptr: u32, len: u32) -> Vec<u8> {
        let buffer = self.inner.buffer();
        let bytes = Uint8Array::new(&buffer);
        bytes.slice(ptr, ptr + len as u32).to_vec()
    }

    /// Get the inner wasm memory object
    pub fn inner(&self) -> &WebAssembly::Memory {
        &self.inner
    }
}
