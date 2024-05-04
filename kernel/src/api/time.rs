use std::sync::Arc;

use honeyos_process::api::{ApiModuleBuilder, ApiModuleCtx};
use wasm_bindgen::closure::Closure;

/// Register the time api
pub fn register_time_api(_: Arc<ApiModuleCtx>, builder: &mut ApiModuleBuilder) {
    // hapi_time_now
    // Get the time in seconds since the start of the process
    builder.register(
        "hapi_time_since_startup",
        Closure::<dyn Fn() -> f64>::new(move || {
            let now = web_sys::js_sys::eval("self.performance.now()")
                .unwrap()
                .unchecked_into_f64();
            perf_to_system(now)
        })
        .into_js_value(),
    );
}

/// Convert performance time to system time
fn perf_to_system(amt: f64) -> f64 {
    (amt as f64) / 1_000.0
}
