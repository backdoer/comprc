echo "██████╗  █████╗  ██████╗██╗  ██╗██████╗  ██████╗ ███████╗██████╗ "
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔═══██╗██╔════╝██╔══██╗"
echo "██████╔╝███████║██║     █████╔╝ ██║  ██║██║   ██║█████╗  ██████╔╝"
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║  ██║██║   ██║██╔══╝  ██╔══██╗"
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██████╔╝╚██████╔╝███████╗██║  ██║"
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝"
echo "                                                                 "
fortune | cowsay

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# fzf
source ~/.fzf.zsh

# User configuration
export EDITOR='vim'

# git
gall(){
  git add .
  git commit -m "$1"
  git push
}

# clear
alias c=clear

# TMUX
alias e_tmux="vim $HOME/.tmux.conf"
alias s_tmux="tmux source-file $HOME/.tmux.conf"
alias ksesh_tmux="tmux kill-session -t"
alias sesh_tmux="tmux list-sessions"
alias ntmux="tmux new-session -s"
alias asesh_tmux="tmux attach -t"

# directories
alias ls='ls -GFh'

# THEME
# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

export LSCOLORS='gxBxhxDxfxhxhxhxhxcxcx'
# primary prompt
PROMPT='\
$FG[039]%~\
$(git_prompt_info) \
$FG[039]%(!.#.»)%{$reset_color%} '

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[255]($FG[255]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
