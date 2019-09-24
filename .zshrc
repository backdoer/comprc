# Source shared shell commands
source ~/comprc/.shell-functions

# Into
echo_intro

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
  colored-man-pages
	#zsh-autosuggestions
  #zsh-syntax-highlighting
)

# History
SAVEHIST=1000
HISTFILE=~/.zsh_history

# oh my zsh
source $ZSH/oh-my-zsh.sh

# Directory listings
alias ls='ls -GF'

# fzf
source ~/.fzf.zsh

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


# GOOGLE
# Chrome history search
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
ch() {
# chrome - browse chrome history
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Google
alias gg='googler'
alias ggl='googler --lucky'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Add npm to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.asdf/installs/nodejs/9.3.0/.npm/bin"
# Add python pip packages to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

# Java
export ANDROID_HOME="/Users/tylerdoermann/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH="$PATH:$JAVA_HOME/bin"
