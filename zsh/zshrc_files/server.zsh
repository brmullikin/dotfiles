# Start an HTTP server from a directory, optionally specifying the port
function serve() {
  local port="${1:-8888}"
  open "http://localhost:${port}/"
  python -m http.server $port
}


