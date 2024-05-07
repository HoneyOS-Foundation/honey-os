use std::os::raw::c_void;

#[link(wasm_import_module = "hapi")]
extern "C" {
    /// ------ JS Console ------

    /// Logs a string to the js console as info
    pub fn hapi_js_console_log_info(ptr: *const u8, len: u32);
    /// Logs a string to the js console as a warning
    pub fn hapi_js_console_log_warn(ptr: *const u8, len: u32);
    /// Logs a string to the js console as an error
    pub fn hapi_js_console_log_error(ptr: *const u8, len: u32);

    /// ------  Stdout  ------

    /// Clear honeyos's stdout
    pub fn hapi_stdout_clear();
    /// Clear last line in honeyos's stdout
    pub fn hapi_stdout_clear_line();
    /// Print a string to honeyos's stdout
    pub fn hapi_stdout_write(ptr: *const u8, len: u32);

    /// ------  Process  ------

    /// Write the pid to a char buffer. If the char buffer is less than 36-chars long it causes undefined behavior.
    /// Returns the process id of the current process
    pub fn hapi_process_get_pid() -> *const u8;

    /// ------  Memory  ------

    /// Allocate a block of memory and return it's pointer.
    /// Return null if the memory allocation failed
    pub fn hapi_mem_alloc(size: u32) -> *mut c_void;
    /// Reallocate a block of memory and return the new pointer.
    /// Return null if the memory allocation failed
    pub fn hapi_mem_realloc(ptr: *mut c_void, size: u32) -> *mut c_void;

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
    /// Get the key in the displays key buffer. Clears it afterwards.
    /// Returns -1 if no display is registered, or if the key buffer is empty.
    pub fn hapi_display_get_key_buffer() -> i32;
    /// Whether or not the shift key is in the key buffer
    /// Returns -1 if no display is registered, or if the key buffer is empty.
    pub fn hapi_display_get_key_shift() -> i32;
    /// Whether or not the control key is in the key buffer
    /// Returns -1 if no display is registered, or if the key buffer is empty.
    pub fn hapi_display_get_key_ctrl() -> i32;
    /// Clears the key buffer of the display
    /// Returns -1 if no display is registered, or if the key buffer is empty.
    pub fn hapi_display_clear_key() -> i32;

    /// ------  Time  ------

    /// Get the time in seconds since the start of the process
    pub fn hapi_time_since_startup() -> f64;

    /// ------  Browser ------
    // Returns a pointer to the user agent.
    // Returns NULL if failed allocate the string.
    pub fn hapi_browser_user_agent() -> *const u8;
    // Returns the length of the user agent string
    pub fn hapi_browser_user_agent_length() -> u32;
    // Returns whether the browser is online
    pub fn hapi_browser_is_online() -> u32;
}
