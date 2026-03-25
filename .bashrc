# Source shared shell commands
source ~/comprc/.shell-functions

# Intro
echo_intro

## Bash-specific
alias e_bashrc="vim $HOME/.bashrc"
alias s_bashrc="source $HOME/.bashrc"

# Git prompt
source $HOME/comprc/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Theme
export PS1='\[\e[1;36m\]\w\[\e[0m\]$(__git_ps1 "(%s)")\$ '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
