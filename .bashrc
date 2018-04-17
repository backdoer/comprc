## If there is an existing bashrc on the computer, then run it before running this bashrc
# if [ -f ~/comprc_old/.bashrc ];then
# 	    source ~/comprc_old/.bashrc
# fi

echo "██████╗  █████╗  ██████╗██╗  ██╗██████╗  ██████╗ ███████╗██████╗ "
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔═══██╗██╔════╝██╔══██╗"
echo "██████╔╝███████║██║     █████╔╝ ██║  ██║██║   ██║█████╗  ██████╔╝"
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║  ██║██║   ██║██╔══╝  ██╔══██╗"
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██████╔╝╚██████╔╝███████╗██║  ██║"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo "                                                                 "
fortune | cowsay
#
##.BASHRC COMMANDS
alias e_bashrc="vim $HOME/.bashrc"
alias s_bashrc="source $HOME/.bashrc"

# Atom
alias save_atom="apm list --installed --bare > ~/comprc/.atom-packages.list"
alias install_atom="apm install --packages-file ~/comprc/.atom-packages.list"


###TMUX
alias e_tmux="vim $HOME/.tmux.conf"
alias s_tmux="tmux source-file $HOME/.tmux.conf"
alias ksesh_tmux="tmux kill-session -t"
alias sesh_tmux="tmux list-sessions"
alias ntmux="tmux new-session -s"
alias asesh_tmux="tmux attach -t"

# CLEAR SCREEn
alias c="clear"

#Default Editor
export EDITOR="vim"

#VIM
alias e_vimrc="vim $HOME/.vimrc"

#GIT COMMANDS
alias gp="git push"
alias gb="git branch"

gco(){
  git checkout $1
}
gn(){
  git checkout -b $1
}
gall(){
	git add .
	git commit -m "$1"
	git push
}
gd(){
  git branch -d $1
}

# Commits all changes in comrc directory and pushes to master
gcomprc(){
	cwd=$(pwd)
	cd ~/comprc
	$(gall "$1")
	cd $cwd
}
pcomprc(){
	cwd=$(pwd)
	cd ~/comprc
	git pull origin master
	cd $cwd
	s_bashrc
	s_tmux
}

# Show git status in terminal
source $HOME/comprc/.git-prompt.sh

# For git bash prompts
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

export PS1='\[\e[1;36m\]\w\[\e[0m\]$(__git_ps1 "(%s)")\$ '
#export PS1='\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;36m\]\w\[\e[0m\]$(__git_ps1 "(%s)")\$ '
#export PS1="\w \$"

if [[ ! -f /tmp/.id_added ]];then
	 ssh-add -K ~/.ssh/id_rsa
	  touch /tmp/.id_added
fi

#Terminal Design
#export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$(__git_ps1 "(%s)"\$'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Directory listing aliases
alias ls='ls -GFh'
alias ll='ls -l'
alias la='ls -a'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
