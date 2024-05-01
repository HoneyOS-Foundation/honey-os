#![no_std]
use core::panic::PanicInfo;

#[link(wasm_import_module = "hapi")]
extern "C" {
    fn println(i: u32);
}

/// The entrypoint for a honeyos app
#[no_mangle]
pub unsafe extern "C" fn _start() {
    for i in 0..10 {
        println(i);
    }
}

/// The panic handler for the app
#[panic_handler]
fn panic(_: &PanicInfo) -> ! {
    loop {}
}
