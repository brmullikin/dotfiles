#!/bin/sh

# WARNING: this script assumes you are on a mac.

# 1. Install Sublime Text 3
# 2. Install Hack font
# 3. Install bundled Package Control
# 4. Symlink packages
# 5. Symlink preferances

# symlink subl
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"

# symlink setting files

if test $(which brew); then

    #Install Sublime text via the command line
    #This also installs subl to your path
    brew cask install sublime-text
    echo "Sublime Text installed"

    # Install Hack font (http://sourcefoundry.org/hack/)
    brew cask install font-hack
    echo "Font Hack Installed"

    DOT_DIR="$PWD/sublime_text/sublime_files/"
    SUB_DIR="$HOME/Library/Application Support/Sublime Text 3"
    SUB_INS_DIR="$SUB_DIR/Installed Packages"
    SUB_USR_DIR="$SUB_DIR/Packages/User"
    STAMP=$(date +%s)

    if [[ -d $SUB_INS_DIR ]] || mkdir -p "$SUB_INS_DIR"; then
        cp "$DOT_DIR/Package Control.sublime-package" "$SUB_INS_DIR/Package Control.sublime-package"
    fi

    if [[ -d $SUB_USR_DIR ]] || mkdir -p "$SUB_USR_DIR"; then
        if [ -f "$SUB_USR_DIR/Package Control.sublime-settings" ]; then
            mv "$SUB_USR_DIR/Package Control.sublime-settings" "$SUB_USR_DIR/Package Control.sublime-settings.$STAMP"
        fi
        if [ -f "$SUB_USR_DIR/Preferences.sublime-settings" ]; then
            mv "$SUB_USR_DIR/Preferences.sublime-settings" "$SUB_USR_DIR/Preferences.sublime-settings.$STAMP"
        fi

        ln -s "$DOT_DIR/Package Control.sublime-settings" "$SUB_USR_DIR/Package Control.sublime-settings"

        ln -s "$DOT_DIR/Preferences.sublime-settings" "$SUB_USR_DIR/Preferences.sublime-settings"
    fi
fi
