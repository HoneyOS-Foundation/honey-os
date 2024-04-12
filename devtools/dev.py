#!/usr/bin/env python3

"""
Hosts a http server for development purposes.
It inject a socket server into the http server to allow for live reload.
"""
import os
import http.server
from websockets.server import serve, WebSocketServerProtocol
from watchfiles import awatch
import threading
import asyncio

PORT = 8200
SOCKET_PORT = 8300

HTML_FILE = 'dist/www/index.html'
STATIC_DIR = 'dist/www'
DIST_DIR = 'dist'

# The script that will be injected into the html file to allow for live reload
LIVE_RELOAD_JS = f"""
<!-- Live reload script (Injected) -->
<script>
    var socket = new WebSocket('ws://localhost:{SOCKET_PORT}');
    socket.onmessage = function(event) {{
        if (event.data === 'reload') {{
            window.location.reload();
        }}
    }};
</script>
"""

# If no dist folder exists, create one
if not os.path.exists(DIST_DIR):
    os.makedirs(DIST_DIR)

# Copy the www folder to the dist folder
os.system(f'cp -r www dist')

html = open(HTML_FILE, 'r').read()
html = html.replace('</body>', LIVE_RELOAD_JS + '</body>')

websocket = None
watch_thread = None
http_thread = None
connection = None

# Tells the threads to stop
stop_event = asyncio.Event()


class Handler(http.server.SimpleHTTPRequestHandler):
    """
    A custom handler that injects the live reload script into the html file.
    """

    def do_GET(self):
        print("GET", self.path)
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(html.encode('utf-8'))
        else:
            return http.server.SimpleHTTPRequestHandler.do_GET(self)


def build():
    """
    Builds the rust project.
    """
    os.system('cargo make dist-dev debug')


def reload():
    """
    Reloads the page.
    """
    if connection:
        # Copy the www folder to the dist folder
        os.system('cp -r www dist')
        connection.send('reload')


async def ws_handle_connection(ws: WebSocketServerProtocol, path):
    """
    Handles the websocket connection.
    """
    global connection
    connection = ws
    try:
        await ws.recv()
    except:
        pass
    return ws


async def run_socket_server():
    """
    Runs the websocket server.
    """
    async with serve(host='localhost', port=SOCKET_PORT, ws_handler=ws_handle_connection):
        while not stop_event.is_set():
            await asyncio.sleep(1)


def host_http_server():
    """
    Hosts the http server.
    """
    httpd = http.server.ThreadingHTTPServer(('localhost', PORT), Handler)
    print(f'Serving at http://localhost:{PORT}')
    while not stop_event.is_set():
        httpd.handle_request()
    print('Server stopped')


async def watch_rust_files():
    """
    Watches the rust files for changes and sends a message to the websocket server.
    """
    while not stop_event.is_set():
        # If any file changes, send a message to the websocket server
        async for event in awatch('src', "www"):
            build()
            if connection:
                await connection.send('reload')
            await asyncio.sleep(0.1)


async def main():
    """
    Main function that serves the http server and the websocket server.
    """
    global websocket, watch_thread, http_thread, stop_event
    print('Building the project')

    # Build the project
    build()

    # Start the http server on a separate thread
    http_thread = threading.Thread(target=host_http_server)
    http_thread.start()

    # Watch the rust files on a separate thread
    watch_thread = threading.Thread(
        target=lambda: asyncio.run(watch_rust_files()))
    watch_thread.start()

    # Start the websocket server
    await run_socket_server()


if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    try:
        loop.run_until_complete(main())
    except KeyboardInterrupt:
        stop_event.set()
        loop.run_until_complete(asyncio.sleep(0.1))
    finally:
        loop.close()
