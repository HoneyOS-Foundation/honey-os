#[link(wasm_import_module = "hapi")]
extern "C" {
    fn println(ptr: *const u8, len: usize);
}

/// The entrypoint for a honeyos app
#[no_mangle]
pub unsafe extern "C" fn _start() {
    for _ in 0..10 {
        let s = "Hello, from wasm!";
        let ptr = s.as_ptr();
        println(ptr, s.len());
    }
}
