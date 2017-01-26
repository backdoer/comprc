
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

#SSH CONNECTIONS
alias bsdr-p="ssh o14e2352327934@blueskiesdronerental.com"
alias bsdr-s="ssh i9403600039150@940.17d.myftpupload.com"
alias mean="ssh -i "/Users/tdoermann/Documents/tech/IS560SSH.pem" ubuntu@ec2-35-167-69-39.us-west-2.compute.amazonaws.com"
alias advdb_box="ssh -i "/Users/tdoermann/Documents/tech/is566_db.pem" linux1@148.100.5.249"
alias byubox="ssh tylerdoe@104.243.43.114"

##WEBSITES
alias bsdr-a="open http://www.blueskiesdronerental.com/wp-admin"

#GIT COMMANDS
alias gpom="git push origin master"
gall(){
	git add .
	git commit -m "$1"
	git push origin master
}

gtest(){
	echo $1
}

#SUBLIME
sublime(){
	/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl $1
}

#NAVIGATION
alias progdir="cd /Users/tdoermann/Documents/School/Programming/"
progdir

##TMUX
alias e_tmux="vim $HOME/.tmux.conf"
alias s_tmux="tmux source-file $HOME/.tmux.conf"
alias ksesh_tmux="tmux kill-session -t"
alias sesh_tmux="tmux list-sessions"
alias ntmux="tmux new-session -s"
alias osesh_tmux="tmux attach -t"

#VIM
alias e_vimrc="vim $HOME/.vimrc"

##EMAIL
alias email="open https://www.gmail.com"


