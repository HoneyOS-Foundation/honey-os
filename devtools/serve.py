import http.server
import os
import shutil

PORT = 8080
HOST = "127.0.0.1"

# The path to the html file
HTTP_FILE_PATH = "www/index.html"
# The path to the www dir
WWW_DIR_PATH = "www"
# The pkg directory
PKG_DIR_PATH = "pkg"

# Open the index.html
html = open(HTTP_FILE_PATH, "r").read()


class Handler(http.server.SimpleHTTPRequestHandler):
    """
    A custom handler that injects the live reload script into the html file.
    """

    def do_GET(self):
        print("GET", self.path)
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.send_header("Access-Control-Allow-Origin", "*")
            self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
            self.send_header("Cross-Origin-Opener-Policy", "same-origin")
            self.send_header("Cross-Origin-Resource-Policy", "cross-origin")
            self.end_headers()
            self.wfile.write(html.encode('utf-8'))
        else:
            self.path = PKG_DIR_PATH + self.path
            print(self.path)
            return http.server.SimpleHTTPRequestHandler.do_GET(self)


def pkg_bootloader():
    """ Build and package the bootloader """
    os.system(
        "cd bootloader && cargo build --release --target wasm32-unknown-unknown")
    shutil.copyfile(
        "target/wasm32-unknown-unknown/release/bootloader.wasm", "pkg/boot.wasm")


def pkg_kernel():
    """ Build the kernel """
    os.system("cd kernel && cargo make pkg")


def pkg_www():
    # Copy www to pkg
    new_dir = PKG_DIR_PATH + "/" + WWW_DIR_PATH
    if os.path.exists(new_dir):
        shutil.rmtree(new_dir)
    shutil.copytree(WWW_DIR_PATH, new_dir)


def package():
    """ Package the os """
    if not os.path.exists("pkg"):
        os.mkdir("pkg")

    pkg_bootloader()
    pkg_kernel()
    pkg_www()


def main():
    package()
    httpd = http.server.ThreadingHTTPServer((HOST, PORT), Handler)
    print(f'Serving at http://{HOST}:{PORT}')
    httpd.serve_forever()


if __name__ == "__main__":
    main()
