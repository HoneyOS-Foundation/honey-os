use std::ffi::CStr;

/// A network error
#[derive(Debug)]
pub enum NetworkError {
    InvalidRequestId(String),
    InvalidHeaders,
    InvalidRequestStatus(u32),
    RequestFailure(String),
    StillProcessing(String),
    StillPending(String),
    AllocFailure(String),
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

/// Represents a request
#[derive(Debug)]
pub struct Request(String);

impl Request {
    /// Create a new network request
    pub fn new(
        url: impl Into<String>,
        method: RequestMethod,
        headers: impl Into<String>,
    ) -> Result<Self, NetworkError> {
        let url: String = url.into();
        let headers: String = headers.into();
        let method: u32 = method.into();

        let pid = unsafe {
            crate::ffi::hapi_network_request(
                url.as_ptr(),
                url.len() as u32,
                method,
                headers.as_ptr(),
                headers.len() as u32,
            )
        };

        if pid == std::ptr::null() {
            return Err(NetworkError::InvalidHeaders);
        }

        // # Safety
        // Since the pid is garunteed to have a null terminator, there is no way of accessing unallocated memory.
        let pid_str = unsafe { CStr::from_ptr(pid as *const i8) };
        Ok(Request(pid_str.to_string_lossy().to_string()))
    }

    /// Create a new network request to the local server
    pub fn new_local(
        url: impl Into<String>,
        method: RequestMethod,
        headers: impl Into<String>,
    ) -> Result<Self, NetworkError> {
        let url: String = url.into();
        let headers: String = headers.into();
        let method: u32 = method.into();

        let pid = unsafe {
            crate::ffi::hapi_network_request_local(
                url.as_ptr(),
                url.len() as u32,
                method,
                headers.as_ptr(),
                headers.len() as u32,
            )
        };

        if pid == std::ptr::null() {
            return Err(NetworkError::InvalidHeaders);
        }

        // # Safety
        // Since the pid is garunteed to have a null terminator, there is no way of accessing unallocated memory.
        let pid_str = unsafe { CStr::from_ptr(pid as *const i8) };
        Ok(Request(pid_str.to_string_lossy().to_string()))
    }

    /// Check the status of the request
    pub fn status(&self) -> Result<RequestStatus, NetworkError> {
        let status = unsafe {
            crate::ffi::hapi_network_request_status(self.0.as_ptr(), self.0.len() as u32)
        };
        if status <= -1 {
            return Err(NetworkError::InvalidRequestId(self.0.clone()));
        }
        let status = status as u32;
        status.try_into()
    }

    /// Get the data of the request
    pub fn data(&self) -> Result<Vec<u8>, NetworkError> {
        let status = self.status()?;
        match status {
            RequestStatus::Processing => Err(NetworkError::StillProcessing(self.0.clone())),
            RequestStatus::Fail => Err(NetworkError::RequestFailure(self.0.clone())),
            RequestStatus::Pending => Err(NetworkError::StillPending(self.0.clone())),
            RequestStatus::Success => {
                let ptr = unsafe {
                    crate::ffi::hapi_network_request_data(self.0.as_ptr(), self.0.len() as u32)
                };

                if ptr == std::ptr::null() {
                    return Err(NetworkError::AllocFailure(self.0.clone()));
                }

                let len = unsafe {
                    crate::ffi::hapi_network_request_data_length(
                        self.0.as_ptr(),
                        self.0.len() as u32,
                    )
                };
                let slice = unsafe { std::slice::from_raw_parts(ptr, len as usize) };

                Ok(slice.to_vec())
            }
        }
    }

    /// Block until the request is complete.
    /// Returns it's status.
    pub fn wait(&self) -> Result<RequestStatus, NetworkError> {
        loop {
            let status = self.status()?;
            match status {
                RequestStatus::Success | RequestStatus::Fail => return Ok(status),
                _ => continue,
            };
        }
    }

    /// Get the id
    pub fn id(&self) -> &str {
        self.0.as_str()
    }
}

impl Drop for Request {
    fn drop(&mut self) {
        unsafe { crate::ffi::hapi_network_request_drop(self.0.as_ptr(), self.0.len() as u32) }
    }
}

impl std::error::Error for NetworkError {}

impl std::fmt::Display for NetworkError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            NetworkError::InvalidRequestId(id) => {
                writeln!(f, "The request {} does not or no longer exists", id)
            }
            NetworkError::InvalidHeaders => writeln!(f, "Unable to parse request headers"),
            NetworkError::InvalidRequestStatus(v) => {
                writeln!(f, "Request status of {} is invalid", v)
            }
            NetworkError::RequestFailure(id) => writeln!(f, "Request {} failed to complete", id),
            NetworkError::StillProcessing(id) => {
                writeln!(f, "Request {} is still being processed", id)
            }
            NetworkError::StillPending(id) => {
                writeln!(f, "Request {} is still pending", id)
            }
            NetworkError::AllocFailure(id) => {
                writeln!(
                    f,
                    "Failed to allocate memory to hold data of request {}",
                    id
                )
            }
        }
    }
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

impl TryFrom<u32> for RequestStatus {
    type Error = NetworkError;

    fn try_from(value: u32) -> Result<Self, Self::Error> {
        match value {
            0 => Ok(RequestStatus::Processing),
            1 => Ok(RequestStatus::Success),
            2 => Ok(RequestStatus::Fail),
            3 => Ok(RequestStatus::Pending),
            _ => Err(NetworkError::InvalidRequestStatus(value)),
        }
    }
}
