#!/usr/bin/env python3
# минимальное веб-приложение, отдаёт “Hello World”

from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)      # отправляем код 200
        self.end_headers()           # завершаем заголовки
        self.wfile.write(b"Hello World")  # тело ответа

if __name__ == "__main__":
    HTTPServer(("0.0.0.0", 8080), Handler).serve_forever()
