use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemFn, ReturnType};

/// Set the main function as an entrypoint.
/// The entrypoint can be generic or async.
/// It can also have an error return type
/// ```
/// /// Generic
/// #[hapi::main]
/// fn main() {
///     hapi::println!("Hello, world!");
/// }
///
/// /// Async
/// #[hapi::main]
/// async fn main() {
///     // async code
/// }
///
/// /// With error
/// #[hapi::main]
/// fn main() -> Result<(), Box<dyn std::error::Error>> {
///     hapi::println!("Hello, world!");
///     Ok(())
/// }
/// ```
#[proc_macro_attribute]
pub fn main(_: TokenStream, item: TokenStream) -> TokenStream {
    let entrypoint = parse_macro_input!(item as ItemFn);

    if entrypoint.sig.ident.to_string() != "main" {
        panic!("The entrypoint should be named main")
    }

    let entrypoint_call = match entrypoint.sig.asyncness {
        Some(_) => quote! { main().await },
        _ => quote! {main()},
    };
    let entrypoint_call = match entrypoint.sig.output {
        ReturnType::Default => entrypoint_call,
        _ => quote! {#entrypoint_call.unwrap()},
    };
    let entrypoint_call = match entrypoint.sig.asyncness {
        Some(_) => quote! {
            hapi::futures::spawn_local(async {
                #entrypoint_call;
            })
        },
        _ => entrypoint_call,
    };

    quote! {
        #[no_mangle]
        pub extern "C" fn _start() {
            #entrypoint

            std::panic::set_hook(Box::new(|info| {
                let message = info.to_string();
                hapi::println!("{}", message);
            }));

            #entrypoint_call;
        }
    }
    .into()
}
