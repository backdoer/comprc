## If there is an existing bashrc on the computer, then run it before running this bashrc
# if [ -f ~/comprc_old/.bashrc ];then
# 	    source ~/comprc_old/.bashrc
# fi

# Source shared shell commands
source ~/comprc/.shell-functions

# Intro
echo_intro

if [[ ! -f /tmp/.id_added ]];then
  ssh-add -K ~/.ssh/id_rsa
  touch /tmp/.id_added
fi


#
##.BASHRC COMMANDS
alias e_bashrc="vim $HOME/.bashrc"
alias s_bashrc="source $HOME/.bashrc"

# CLEAR SCREEn
alias c="clear"

# Show git status in terminal
source $HOME/comprc/.git-prompt.sh

# Theme
# For git bash prompts
GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1


#Terminal Design
export PS1='\[\e[1;36m\]\w\[\e[0m\]$(__git_ps1 "(%s)")\$ '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Directory listing aliases
alias la='ls -a'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change
export PATH="$PATH:$HOME/.rvm/bin"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
