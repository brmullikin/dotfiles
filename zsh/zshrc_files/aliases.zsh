# Python
alias python=python3
alias pip=pip3
alias pycclean='find . -name "*.pyc" -exec rm {} \;'
export PYTHONDONTWRITEBYTECODE=True

# WWW directory
alias www='cd ~/www'

# Website aliases
alias notes='www; cd heroku/brmullikin'
alias netcrit='www; cd heroku/netcrit'
alias inexsilio='www; cd heroku/inexsilio'
alias olb='www; cd heroku/oldlostbooks'
alias lit='www; cd heroku/goodlitcrit'
alias brm='www;cd heroku/brmwebdev'
alias gen='www; cd generators/generator-brmflask'
alias mgp='www; cd mgp/mgp'
alias tpb='www; cd heroku/towerpressbooks'

# Homestead
alias hsc='www; cd homestead/code'
alias hsl='www; cd homestead/launch'

# # Sublime Text
# alias e='subl .'
# alias sub='subl'

# LS
alias ls='ls -G'
unsetopt auto_cd

# Servers
alias plato='ssh ben@plato.dissata.com -p 326'
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
    py.test -v --cov-report term-missing --cov $1
}
