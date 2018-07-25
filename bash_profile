export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=/usr/local/bin/:$PATH
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
export PATH=/Users/jvanderzwaag/Library/Python/2.7/bin:$PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
