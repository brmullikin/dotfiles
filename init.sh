#!/bin/sh

# Current working directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Execute all the various config files.
for files in ${DIR}/**/config.sh; do source $files; done

# Alternatively, execute only specific configs,
# or execute configs in a specific order

# sh ${DIR}/bin/config.sh
# sh ${DIR}/environ/config.sh
# sh ${DIR}/git/config.sh
# sh ${DIR}/homebrew/config.sh
# sh ${DIR}/macos/config.sh
# sh ${DIR}/ohmyzsh/config.sh
# sh ${DIR}/sublime_text/config.sh
# sh ${DIR}/system/config.sh
# sh ${DIR}/zsh/config.sh

echo "...\nConfiguration Done. Enjoy!"
