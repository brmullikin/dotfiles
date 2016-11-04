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

    # Install Sublime text via the command line
    # This also installs subl to your path
    brew cask install sublime-text
    echo "Sublime Text installed"

    # Install Hack font (http://sourcefoundry.org/hack/)
    brew cask install font-hack
    echo "Font Hack Installed"

    # Install Package Controll
    cp $PWD/sublime_text/sublime_files/Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

    # Symbolic link for sublime text packages
    mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings.old
    ln -s $PWD/sublime_text/sublime_files/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

    # Symbolic link for sublime text packages
    mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings.old
    ln -s $PWD/sublime_text/sublime_files/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
fi
