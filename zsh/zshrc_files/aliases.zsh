# Python
alias python=python3
alias pip=pip3
alias pycclean='find . -name "*.pyc" -exec rm {} \;'
export PYTHONDONTWRITEBYTECODE=True

# WWW directory
alias www='cd ~/www'
alias ideco='cd ~/www; cd github/idecoio'

# Servers
#alias plato='ssh ben@plato.dissata.com -p 326'
alias plato='mosh --ssh="ssh -p 326" ben@plato.dissata.com'
alias cicero='ssh root@cicero.dissata.com'

# Gunicorn Config
alias gunicorn='gunicorn --log-file=-'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


function flake() {
    Flake8 --max-line-length=100 --ignore=E302,D203 --exclude __init__.py $1
}
function pytest() {
    py.test -v $1
}
function cov() {
    py.test -v --cov-report term-missing --cov --ignore=node_modules $1
}

function brmflask() {
    if [ $# -eq 0 ]; then
        echo "No folder name supplied";
    elif [ -d "$PWD/$1" ]; then
        echo "Directory already exists. Please choose another directory."
    else
        if ask "Install BRMFLASK in directory $PWD/$1?"; then
            echo "Installing BRMFLASK..."
            git clone git@github.com:brmullikin/BRMFlask_boilerplate.git $1
            cd $1
            npm install
            bower install
            git checkout tags/v0.0.2
            rm -rf ".git"
            git init
            git add .
            git commit -m "first commit"
            workon brmflask
            echo "Ready to go."
        fi
    fi
}

function brmpress() {
    # TODO
    # 1. rename local-config-example.php to local-config.php
    if [ $# -eq 0 ]; then
        echo "No folder name supplied";
    elif [ -d "$PWD/$1" ]; then
        echo "Directory already exists. Please choose another directory."
    else
        if ask "Install BRMPRESS v0.0.2 in directory $PWD/$1?"; then
            echo "Installing BRMPRESS..."
            git clone git@github.com:brmullikin/brmpress.git $1
            cd $1
            git checkout tags/v0.0.2
            rm -rf ".git"
            git init
            git add .
            git commit -m "first commit"
            cd public/content/themes/brmpress
            npm install
            bower install
            cd ../../../../
            echo "Ready to go."
        fi
    fi
}

function confirm() {
    read -q "REPLY?Are you sure? (y/N): "
}

ask() {
    local prompt default REPLY
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}
