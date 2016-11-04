# Install Homebrew if not already installed
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /usr/local/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Allow for installation of apps via CLI
    brew tap caskroom/cask
    echo "Homebrew Installed"
fi

# Install Brew Packages
brew_packges="git imagemagick node python python3 siege wget z zsh zsh-completions"
for brew_pkg in ${brew_packges}; do
    if ! brew list -1 | grep -q "^${brew_pkg}\$"; then
        echo "Installing '$brew_pkg'..."
        brew install ${pkg}
        echo "'$brew_pkg' Installed"
    fi
done

# Node install command is here to guarantee brew node is run first
node_packges="bower generator-wordpress grunt gulp jshint less yo"
if test $(which npm); then
    for node_pkg in ${node_packges}; do
        if ! npm list -g --depth=0 | grep -q "${node_pkg}"; then
            echo "Installing '$node_pkg'..."
            npm install -g --silent ${node_pkg}
            echo "'$node_pkg' Installed"
        fi
    done
fi
