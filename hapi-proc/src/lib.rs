use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemFn};

/// Indicates the method as an entrypoint
#[proc_macro_attribute]
pub fn main(_: TokenStream, item: TokenStream) -> TokenStream {
    let entrypoint = parse_macro_input!(item as ItemFn);
    quote! {
        #[no_mangle]
        pub extern "C" fn _start() {
            #entrypoint

            std::panic::set_hook(Box::new(|info| {
                let message = info.to_string();
                hapi::println!("{}", message);
            }));


            main();
        }
    }
    .into()
}
