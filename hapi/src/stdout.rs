/// Print to honeyos's stdout
#[macro_export]
macro_rules! print {
    ($($t:tt)*) => (hapi::stdout::write(&format_args!($($t)*).to_string()))
}

/// Print a line to honeyos's stdout. With a newline
#[macro_export]
macro_rules! println {
    ($($t:tt)*) => (hapi::stdout::writeln(&format_args!($($t)*).to_string()))
}

/// Clear honeyos's stdout
pub fn clear() {
    // # Safety
    // stdout_clear is garunteed to be safe by honeyos's implementation.
    // If the honeyos kernel is non-standard, there are no safety garuntees and this might be unsound
    unsafe { crate::ffi::hapi_stdout_clear() }
}

/// Clear the last line in honeyos's stdout
pub fn clear_line() {
    // # Safety
    // stdout_clear is garunteed to be safe by honeyos's implementation.
    // If the honeyos kernel is non-standard, there are no safety garuntees and this might be unsound
    unsafe { crate::ffi::hapi_stdout_clear_line() }
}

/// Write to honeyos's stdout
pub fn write(string: impl Into<String>) {
    let string: String = string.into();
    let string = format!("{}", string);
    // # Safety
    // Since we are passing the correct pointer and length, we are garunteed not to write unallocated memory
    unsafe { crate::ffi::hapi_stdout_write(string.as_ptr(), string.len() as u32) }
}

/// Write a line to honeyos's stdout
pub fn writeln(string: impl Into<String>) {
    let string: String = string.into();
    let string = format!("{}\n", string);
    // # Safety
    // Since we are passing the correct pointer and length, we are garunteed not to write unallocated memory
    unsafe { crate::ffi::hapi_stdout_write(string.as_ptr(), string.len() as u32) }
}
