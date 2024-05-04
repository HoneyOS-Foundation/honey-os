#[link(wasm_import_module = "hapi")]
extern "C" {
    /// ------  Stdout  ------
    /// Clear honeyos's stdout
    pub fn hapi_stdout_clear();
    /// Clear last line in honeyos's stdout
    pub fn hapi_stdout_clear_line();
    /// Print a string to honeyos's stdout
    pub fn hapi_stdout_write(ptr: *const u8, len: u32);

    /// ------  Display Server  ------
    /// Registers a display for the process
    pub fn hapi_display_server_register();
    /// Claim the display server, displaying the process's display
    /// Returns -1 if no display is registered
    pub fn hapi_display_server_claim_main() -> i32;

    /// ------  Display  ------
    /// Push stdout to the display's text-mode buffer.
    /// Returns -1 if no display is registered
    pub fn hapi_display_push_stdout() -> i32;
    /// Set the text in the displays text-mode buffer.
    /// Returns -1 if no display is registered.
    pub fn hapi_display_set_text(ptr: *const u8, len: u32) -> i32;

    /// ------  Time  ------
    /// Get the time in seconds since the start of the process
    pub fn hapi_time_since_startup() -> f64;
}
