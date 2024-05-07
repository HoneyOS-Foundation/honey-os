use std::future::Future;

/// Run a future in the current thread
pub fn spawn_local<F>(future: F)
where
    F: Future<Output = ()>,
{
    futures::executor::block_on(future);
}
