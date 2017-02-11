# configurations related to mkdir

# Always create entire path
alias mkdir="mkdir -p"

# Make and go to directory
function mkd() {
  mkdir "$@" && cd "$@"
}
