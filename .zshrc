# Source shared shell commands
source ~/comprc/.shell-functions

# Source shared worktree commands
source ~/comprc/.wt-functions

# Intro
echo_intro

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
plugins=(
  git
  colored-man-pages
)

SAVEHIST=1000
HISTFILE=~/.zsh_history

source $ZSH/oh-my-zsh.sh

# fzf
source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Theme
export LSCOLORS='gxBxhxDxfxhxhxhxhxcxcx'
PROMPT='\
$FG[039]%~\
$(git_prompt_info) \
$FG[039]%(!.#.»)%{$reset_color%} '

eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[255]($FG[255]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# Chrome history search
ch() {
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

alias gg='googler'
alias ggl='googler --lucky'

# Ngrok
export PATH="$PATH:/usr/local/bin"

export AWS_PROFILE="veras-aws"
export VANTA_ENV_FILE="$HOME/.vanta_env"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
