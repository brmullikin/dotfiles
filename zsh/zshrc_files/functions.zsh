# Create a new directory and enter it
# https://github.com/nicksp/dotfiles/blob/master/shell/shell_functions
alias mkdir="mkdir -p"
function mdir() {
  mkdir "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function serve() {
  local port="${1:-8888}"
  open "http://localhost:${port}/"
  python -m http.server $port
}
