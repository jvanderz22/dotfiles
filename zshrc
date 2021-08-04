[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
#
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=/usr/local/bin/:$PATH
export PATH=/$HOME/bin/:$PATH
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin:$PATH"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

autoload -Uz compinit && compinit


# eval "$(pyenv init -)"
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias be='bundle exec'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias vi="vim"

alias gru="git remote update --prune"
alias gs="git status"
alias gd="git diff --color"
alias gdc="git diff --cached --color"
alias go='git checkout '
alias gc='git commit'
alias ga='git add '
alias gdm='git diff origin/master HEAD'

alias got='git '

alias aws-login='$(aws ecr get-login --no-include-email --region us-east-1)'

alias dc='docker-compose'
alias dcr='docker-compose -f docker-compose.yml -f docker-compose-runtime-core.yml -f docker-compose-runtime-sync.yml'
alias docker-clean-dangling-images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker-clean-ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker-clean-untagged='docker rm -f $(docker ps | grep "<none>" | awk "{print \$3}")'
alias docker-clean-untagged-images='docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")'
alias docker-clean-volumes='docker volume list | docker volume rm $(awk "{print \$2}")'

alias dl='docker logs'
alias dps='docker ps --format "{{.ID}} / {{.Status}} / {{.Names}}"'
alias dla='docker ps --format "{{.ID}}" | xargs -I{} -n1 docker logs -f {}'

alias agl='$(aws ecr get-login --no-include-email --region us-east-1)'

alias vimfzf='vim -o `fzf`'
alias reset="clear && printf '\e[3J'"
function rack() {
    clear
    printf '\e[3J'
    echo "Command: ack $@"
    ack "$@"
}

git-temp() {
    CURRENT="$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"
    echo "Renaming branch $CURRENT"
    git branch -m "temp/$CURRENT"
}

export PYENV_VERSION="3.7.4"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


export FZF_DEFAULT_OPTS=''
