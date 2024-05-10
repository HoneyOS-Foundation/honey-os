use wasmparser::{Parser, Payload, TypeRef};

/// The runtime requirements for a wasm binary
#[derive(Debug)]
pub struct WasmRequirements {
    pub initial_memory: u32,
    pub maximum_memory: Option<u32>,
    pub shared_memory: bool,
}

impl WasmRequirements {
    /// Parse a binary
    pub fn parse(bin: &[u8]) -> anyhow::Result<Self> {
        let parser = Parser::new(0);

        // Initialize variables to track memory requirements
        let mut initial_memory = 0;
        let mut maximum_memory = Some(0);
        let mut shared_memory = false;

        for payload in parser.parse_all(&bin) {
            match payload? {
                Payload::ImportSection(section) => {
                    for import in section {
                        let import = import?;
                        if import.name == "memory" && import.module == "env" {
                            match import.ty {
                                TypeRef::Memory(memory) => {
                                    initial_memory = memory.initial;
                                    shared_memory = memory.shared;
                                    maximum_memory = memory.maximum.map(|v| v as u32);

                                    if shared_memory && maximum_memory.is_none() {
                                        return Err(anyhow::anyhow!(
                                            "Wasm cannot request shared memory without specifying a maximum memory size"
                                        ));
                                    }
                                }
                                _ => {}
                            }
                        }
                    }
                }
                Payload::MemorySection(section) => {
                    for memory in section {
                        let memory = memory?;
                        initial_memory = memory.initial;
                        shared_memory = memory.shared;
                        maximum_memory = memory.maximum.map(|v| v as u32);

                        if shared_memory && maximum_memory.is_none() {
                            return Err(anyhow::anyhow!(
                                "Wasm cannot request shared memory without specifying a maximum"
                            ));
                        }
                    }
                }
                _ => {}
            }
        }

        Ok(Self {
            maximum_memory,
            initial_memory: initial_memory as u32,
            shared_memory,
        })
    }
}
