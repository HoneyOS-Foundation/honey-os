/// Logs to the js console
#[cfg(feature = "logger")]
pub struct JsConsoleLogger;

#[cfg(feature = "logger")]
impl JsConsoleLogger {
    /// Initialize the logger
    pub fn init() {
        ::log::set_logger(&JsConsoleLogger)
            .map(|()| ::log::set_max_level(::log::LevelFilter::Info))
            .unwrap()
    }
}

#[cfg(feature = "logger")]
impl ::log::Log for JsConsoleLogger {
    fn enabled(&self, metadata: &::log::Metadata) -> bool {
        metadata.level() <= ::log::Level::Info
    }

    fn log(&self, record: &::log::Record) {
        if !self.enabled(record.metadata()) {
            return;
        }

        match record.metadata().level() {
            ::log::Level::Info => log::info(record.args().to_string()),
            ::log::Level::Warn => log::warn(record.args().to_string()),
            ::log::Level::Error => log::error(record.args().to_string()),
            _ => {}
        }
    }

    fn flush(&self) {}
}

pub mod log {
    /// Log a string to the js console as info
    pub fn info(string: impl Into<String>) {
        let string: String = string.into();
        unsafe { crate::ffi::hapi_js_console_log_info(string.as_ptr(), string.len() as u32) }
    }

    /// Log a string to the js console as a warning
    pub fn warn(string: impl Into<String>) {
        let string: String = string.into();
        unsafe { crate::ffi::hapi_js_console_log_warn(string.as_ptr(), string.len() as u32) }
    }

    /// Log a string to the js console as an error
    pub fn error(string: impl Into<String>) {
        let string: String = string.into();
        unsafe { crate::ffi::hapi_js_console_log_error(string.as_ptr(), string.len() as u32) }
    }
}
