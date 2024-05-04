use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemFn, ReturnType};

/// Indicates the method as an entrypoint
#[proc_macro_attribute]
pub fn main(_: TokenStream, item: TokenStream) -> TokenStream {
    let entrypoint = parse_macro_input!(item as ItemFn);

    let function_call = match entrypoint.sig.output {
        ReturnType::Default => quote! {main();},
        _ => quote! {main().unwrap();},
    };
    quote! {
        #[no_mangle]
        pub extern "C" fn _start() {
            #entrypoint

            std::panic::set_hook(Box::new(|info| {
                let message = info.to_string();
                hapi::println!("{}", message);
            }));

            #function_call
        }
    }
    .into()
}
