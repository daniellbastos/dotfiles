source ~/.bash-git-prompt/gitprompt.sh
source ~/.dotfiles/bash/bash_alias

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/devel
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
