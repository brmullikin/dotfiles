# configurations related to mkdir

# Always create entire path
alias mkdir="mkdir -p"

# Make and Go to DIRectory
function mgdir() {
  mkdir "$@" && cd "$@"
}
