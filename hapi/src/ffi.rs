use std::os::raw::c_void;

#[link(wasm_import_module = "hapi")]
extern "C" {
    /// Logs a string to the js console as info
    pub fn hapi_js_console_log_info(ptr: *const u8, len: u32);
    /// Logs a string to the js console as a warning
    pub fn hapi_js_console_log_warn(ptr: *const u8, len: u32);
    /// Logs a string to the js console as an error
    pub fn hapi_js_console_log_error(ptr: *const u8, len: u32);
    /// Clear the process's stdout
    pub fn hapi_stdout_clear();
    /// Clear last line in process's stdout
    pub fn hapi_stdout_clear_line();
    /// Print a string to process's stdout
    pub fn hapi_stdout_write(ptr: *const u8, len: u32);
    /// Returns the process id of the current process
    pub fn hapi_process_get_pid() -> *const u8;
    /// Spawn a wasm binary as a subprocess.
    /// ### Returns
    /// - The pid of the subprocess on success.
    /// - NULL if the subprocess failed to spawn.
    pub fn hapi_process_spawn_subprocess(bin: *const u8, bin_len: u32) -> *const u8;
    /// Allocate a block of memory and return it's pointer.
    /// ### Returns
    /// - The pointer to the block
    /// - `NULL` if the memory allocation failed
    pub fn hapi_mem_alloc(size: u32) -> *mut c_void;
    /// Reallocate a block of memory and return the new pointer.
    /// ### Returns
    /// - The pointer to the block
    /// - `NULL` if the memory allocation failed
    pub fn hapi_mem_realloc(ptr: *mut c_void, size: u32) -> *mut c_void;
    /// Registers a display for the process
    pub fn hapi_display_server_register();
    /// Claim the display server, displaying the process's display
    /// ### Returns
    /// - `0` on success
    /// - `-1` if no display is registered
    pub fn hapi_display_server_claim_main() -> i32;
    /// Push stdout to the display's text-mode buffer.
    /// ### Returns
    /// - `0` on success
    /// - `-1` if no display is registered
    pub fn hapi_display_push_stdout() -> i32;
    /// Set the text in the displays text-mode buffer.
    /// ### Returns
    /// - `0` on success
    /// - `-1` if no display is registered
    pub fn hapi_display_set_text(ptr: *const u8, len: u32) -> i32;
    /// Get the key in the displays key buffer. Clears it afterwards.
    /// ### Returns
    /// - `-1` or if the key buffer is empty.
    /// - `-2` if no display is registered.
    pub fn hapi_display_get_key_buffer() -> i32;
    /// Whether or not the shift key is in the key buffer
    /// ### Returns
    /// - `-1` if no display is registered.
    pub fn hapi_display_get_key_shift() -> i32;
    /// Whether or not the control key is in the key buffer
    /// ### Returns
    /// - `-1` if no display is registered.
    pub fn hapi_display_get_key_ctrl() -> i32;
    /// Clears the key buffer of the display
    /// ### Returns
    /// - `-1` if no display is registered.
    pub fn hapi_display_clear_key() -> i32;
    /// Get the time in seconds since the start of the process
    pub fn hapi_time_since_startup() -> f64;
    /// Returns a pointer to the user agent.
    /// ### Returns
    /// - The user agent on success
    /// - `NULL`` if failed allocate the string.
    pub fn hapi_browser_user_agent() -> *const u8;
    /// Returns the length of the user agent string
    pub fn hapi_browser_user_agent_length() -> u32;
    /// Returns whether the browser is online
    pub fn hapi_browser_is_online() -> u32;
    /// Create a network request and return it's id.
    /// ### Returns:
    /// - The id of the request success
    /// - NULL if the request method was invalid, or when failed to parse headers as json.
    /// ### Methods:
    /// - Get = 0
    /// - Head = 1
    /// - Post = 2
    /// - Put = 3
    /// - Delete = 4
    /// - Connect = 5
    /// - Options = 6
    /// - Trace = 7
    /// - Patch = 8
    pub fn hapi_network_request(
        url: *const u8,
        url_len: u32,
        method: u32,
        headers: *const u8,
        headers_len: u32,
    ) -> *const u8;
    /// Create a network request to the local server and return it's id.
    /// ### Returns:
    /// - The id of the request on success
    /// - NULL if the request method was invalid, or when failed to parse headers as json.
    /// ### Methods:
    /// - Get = 0
    /// - Head = 1
    /// - Post = 2
    /// - Put = 3
    /// - Delete = 4
    /// - Connect = 5
    /// - Options = 6
    /// - Trace = 7
    /// - Patch = 8
    pub fn hapi_network_request_local(
        url: *const u8,
        url_len: u32,
        method: u32,
        headers: *const u8,
        headers_len: u32,
    ) -> *const u8;
    /// Check the status of the request
    /// ### Returns
    /// - `-1` if the request does not exists.
    /// - `0`if the request is pending.
    /// - `1`if the request succeeded.
    /// - `2`if the request failed.
    /// - `3`if the request is still pending
    pub fn hapi_network_request_status(id: *const u8, id_len: u32) -> i32;
    /// Check the lenght of the data in bytes.
    /// ### Returns
    /// - The data length on success
    /// - -1 if the request does not exist.
    pub fn hapi_network_request_data_length(id: *const u8, id_len: u32) -> i32;
    /// Check the data in a request
    /// ### Returns
    /// - The data on success
    /// - NULL if the request does not exist,
    /// - NULL if the request has failed or is still pending,
    /// - NULL if the memory allocation failed.
    pub fn hapi_network_request_data(id: *const u8, id_len: u32) -> *const u8;
    /// Drop the request from memory.
    /// Does nothing if the request does not exist.
    pub fn hapi_network_request_drop(id: *const u8, id_len: u32);
}
