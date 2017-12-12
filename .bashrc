9
# If there is an existing bashrc on the computer, then run it before running this bashrc
if [ -f ~/comprc_old/.bashrc ];then
	    source ~/comprc_old/.bashrc
fi

echo "██████╗  █████╗  ██████╗██╗  ██╗██████╗  ██████╗ ███████╗██████╗ "
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔═══██╗██╔════╝██╔══██╗"
echo "██████╔╝███████║██║     █████╔╝ ██║  ██║██║   ██║█████╗  ██████╔╝"
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║  ██║██║   ██║██╔══╝  ██╔══██╗"
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██████╔╝╚██████╔╝███████╗██║  ██║"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo "                                                                 "

#.BASHRC COMMANDS
alias e_bashrc="vim $HOME/.bashrc"
alias s_bashrc="source $HOME/.bashrc"


##TMUX
alias e_tmux="vim $HOME/.tmux.conf"
alias s_tmux="tmux source-file $HOME/.tmux.conf"
alias ksesh_tmux="tmux kill-session -t"
alias sesh_tmux="tmux list-sessions"
alias ntmux="tmux new-session -s"
alias osesh_tmux="tmux attach -t"

#VIM
alias e_vimrc="vim $HOME/.vimrc"


#GIT COMMANDS
alias gpom="git push origin master"
gall(){
	git add .
	git commit -m "$1"
	git push origin master
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
source $HOME/comprc/.git-prompt.sh
# For git bash prompts
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

export PS1='\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;36m\]\w\[\e[0m\]$(__git_ps1 "(%s)")\$ '

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

