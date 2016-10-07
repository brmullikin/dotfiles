# Configurations related to find

# find shorthand
# https://github.com/nicksp/dotfiles/blob/master/shell/shell_functions
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# Quickly seach files that contain a specific string
qf () {
  find . -exec grep -l -s $1 {} \;
  return 0
}
