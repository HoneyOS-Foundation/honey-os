use web_sys::wasm_bindgen::JsValue;

/// The error handle for honeyos-networking
#[derive(Debug)]
pub enum Error {
    RequestInitFailure(JsValue),
    HeaderParseFailure(JsValue),
    InvalidRequestMethod,
}

impl std::error::Error for Error {}

impl std::fmt::Display for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Error::RequestInitFailure(e) => writeln!(f, "Failed to initialize request: {:?}", e),
            Error::InvalidRequestMethod => writeln!(f, "The provided request method is invalid"),
            Error::HeaderParseFailure(e) => writeln!(f, "Failed to parse headers: {:?}", e),
        }
    }
}
