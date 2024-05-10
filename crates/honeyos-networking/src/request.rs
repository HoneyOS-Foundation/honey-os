/// A scheduled request
#[derive(Debug, Clone)]
pub struct ScheduledRequest {
    pub url: String,
    pub method: RequestMethod,
    pub mode: RequestMode,
    pub headers: String,
}

/// Represents a request stored in the network manager
#[derive(Debug, Clone)]
pub struct Request {
    pub data: Vec<u8>,
    pub status: RequestStatus,
}

/// The status of a request
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RequestStatus {
    Processing = 0,
    Success = 1,
    Fail = 2,
    Pending = 3,
}

/// The request methods
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RequestMethod {
    Get = 0,
    Head = 1,
    Post = 2,
    Put = 3,
    Delete = 4,
    Connect = 5,
    Options = 6,
    Trace = 7,
    Patch = 8,
}

/// The request mode
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RequestMode {
    SameOrigin,
    NoCors,
    Cors,
    Navigate,
}

impl Into<u32> for RequestMethod {
    fn into(self) -> u32 {
        match self {
            RequestMethod::Get => 0,
            RequestMethod::Head => 1,
            RequestMethod::Post => 2,
            RequestMethod::Put => 3,
            RequestMethod::Delete => 4,
            RequestMethod::Connect => 5,
            RequestMethod::Options => 6,
            RequestMethod::Trace => 7,
            RequestMethod::Patch => 8,
        }
    }
}

impl TryFrom<u32> for RequestMethod {
    type Error = crate::error::Error;

    fn try_from(value: u32) -> Result<Self, Self::Error> {
        match value {
            0 => Ok(RequestMethod::Get),
            1 => Ok(RequestMethod::Head),
            2 => Ok(RequestMethod::Post),
            3 => Ok(RequestMethod::Put),
            4 => Ok(RequestMethod::Delete),
            5 => Ok(RequestMethod::Connect),
            6 => Ok(RequestMethod::Options),
            7 => Ok(RequestMethod::Trace),
            8 => Ok(RequestMethod::Patch),
            _ => Err(crate::error::Error::InvalidRequestMethod),
        }
    }
}

impl ToString for RequestMethod {
    fn to_string(&self) -> String {
        match *self {
            RequestMethod::Get => "GET".into(),
            RequestMethod::Head => "HEAD".into(),
            RequestMethod::Post => "POST".into(),
            RequestMethod::Put => "PUT".into(),
            RequestMethod::Delete => "DELETE".into(),
            RequestMethod::Connect => "CONNECT".into(),
            RequestMethod::Options => "OPTIONS".into(),
            RequestMethod::Trace => "TRACE".into(),
            RequestMethod::Patch => "PATCH".into(),
        }
    }
}

impl Into<web_sys::RequestMode> for RequestMode {
    fn into(self) -> web_sys::RequestMode {
        match self {
            RequestMode::Cors => web_sys::RequestMode::Cors,
            RequestMode::Navigate => web_sys::RequestMode::Navigate,
            RequestMode::NoCors => web_sys::RequestMode::NoCors,
            RequestMode::SameOrigin => web_sys::RequestMode::SameOrigin,
        }
    }
}

impl Into<u32> for RequestStatus {
    fn into(self) -> u32 {
        match self {
            RequestStatus::Processing => 0,
            RequestStatus::Success => 1,
            RequestStatus::Fail => 2,
            RequestStatus::Pending => 3,
        }
    }
}
