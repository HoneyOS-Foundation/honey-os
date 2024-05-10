use anyhow::anyhow;
use wasm_bindgen::JsCast;
use web_sys::js_sys::{Reflect, SharedArrayBuffer, Uint8Array, WebAssembly, JSON};

const MAXIMUM_MEMORY: u32 = 16384;

/// (64Kib) The size of one wasm page as specified in the spec:
/// https://developer.mozilla.org/en-US/docs/WebAssembly/JavaScript_interface/Memory/grow
const PAGE_SIZE: u32 = 65536;

/// The sandboxed memory of a process
#[derive(Debug)]
pub struct Memory {
    maximum: Option<u32>,
    inner: WebAssembly::Memory,
}

impl Memory {
    pub fn new(initial: u32, maximum: Option<u32>, shared: bool) -> anyhow::Result<Self> {
        let memory_desc = JSON::parse("{}").unwrap();
        Reflect::set(&memory_desc, &"initial".into(), &initial.into()).unwrap();
        if let Some(maximum_memory) = maximum {
            Reflect::set(&memory_desc, &"maximum".into(), &maximum_memory.into()).unwrap();
        }
        Reflect::set(&memory_desc, &"shared".into(), &shared.into()).unwrap();

        let inner = WebAssembly::Memory::new(memory_desc.unchecked_ref())
            .map_err(|e| anyhow!("Failed to allocate memory for process: {:?}", e))?;

        Ok(Self { inner, maximum })
    }

    /// Read from a certain block of memory
    pub fn read(&self, ptr: u32, len: u32) -> Vec<u8> {
        let buffer = self.inner.buffer();
        let bytes = Uint8Array::new(&buffer);
        bytes.slice(ptr, ptr + len as u32).to_vec()
    }

    /// Write to a certain block of memory
    pub fn write(&self, ptr: u32, data: &[u8]) {
        let bytes = Uint8Array::new(&self.inner.buffer());
        let array = Uint8Array::from(data);
        bytes.set(&array, ptr);
    }

    /// Allocate a block of memory and return it's pointer.
    /// Returns None if the memory exceeds the 32-bit maximum of 4gb
    pub fn alloc(&self, size: u32) -> Option<u32> {
        let buffer = self.inner.buffer().dyn_into::<SharedArrayBuffer>().unwrap();
        let current_size = buffer.byte_length();

        let new_size = current_size + size;

        if let Some(maximum) = self.maximum {
            if new_size / PAGE_SIZE > maximum {
                log::warn!(
                    "Process attempted to allocate more than the maximum of {} pages of ram",
                    maximum
                );
                return None;
            }
        }

        let allocated_ptr = current_size;
        self.inner.grow(size / PAGE_SIZE + 1);
        Some(allocated_ptr)
    }

    // Reallocate a block of memory and returns the new pointer
    pub fn realloc(&self, ptr: u32, new_size: u32) -> Option<u32> {
        let new_ptr = self.alloc(new_size)?;
        self.copy(ptr, new_ptr, new_size);
        Some(new_ptr)
    }

    // Copy data from one memory region to another
    fn copy(&self, src_ptr: u32, dest_ptr: u32, size: u32) {
        let buffer = self.inner.buffer();
        let bytes = Uint8Array::new(&buffer);

        // Perform data copying
        for i in 0..size {
            bytes.set_index(dest_ptr + i, bytes.get_index(src_ptr + i));
        }
    }

    /// Get the inner wasm memory object
    pub fn inner(&self) -> &WebAssembly::Memory {
        &self.inner
    }
}
