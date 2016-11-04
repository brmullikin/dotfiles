#!/bin/sh

# WARNING: this script assumes you are on a mac.

# 1. Install Sublime Text 3
# 2. Install Hack font
# 3. Install bundled Package Control
# 4. Symlink packages
# 5. Symlink preferances
# 6. Symlink Subl

# symlink subl
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"

# symlink setting files

if test $(which brew); then

    # Install Sublime text via the command line
    brew cask install sublime-text
    echo "Sublime Text installed"

    # Install Hack font (http://sourcefoundry.org/hack/)
    brew cask install font-hack
    echo "Font Hack Installed"

    # Symobolic link for sublime text CLI launch.
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"

    # Install Package Controll
    cp "sublime_files/Package Control.sublime-package" "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package Control.sublime-package"

    # Symbolic link for sublime text packages
    mv "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package Control.sublime-settings" "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package Control.sublime-settings.old"
    ln -s "sublime_files/Package Control.sublime-settings" "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package Control.sublime-settings"

    # Symbolic link for sublime text packages
    mv "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Preferences.sublime-settings" "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Preferences.sublime-settings.old"
    ln -s "sublime_files/Preferences.sublime-settings" "~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Preferences.sublime-settings"
fi
