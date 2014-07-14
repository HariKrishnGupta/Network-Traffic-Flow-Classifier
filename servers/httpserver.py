import sys
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

def main():
    
    HandlerClass = SimpleHTTPRequestHandler
    ServerClass  = BaseHTTPServer.HTTPServer
    Protocol     = "HTTP/1.1"
    port = 8000
    
    server_address = ('127.0.0.1', port)
    
    HandlerClass.protocol_version = Protocol
    httpd = ServerClass(server_address, HandlerClass)
    sa = httpd.socket.getsockname()
    print ("Serving HTTP on {} on port {} ...".format(sa[0],sa[1]))
    httpd.serve_forever()

if __name__ == "__main__": main()