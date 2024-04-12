# HoneyOS

A wasm-based WebOS parodying old lesser-known operating systems such as BeOS

## Building

HoneyOS utilizes [cargo-make](https://github.com/sagiegurari/cargo-make).
These are the following build commands:

```
cargo make dist     -- Create a deployment-ready distribution of HoneyOS located in dist
cargo make dist-dev -- Create a distribution of HoneyOS with debug symbols
cargo make dev      -- Serve HoneyOS with hot-reloading enabled
```
