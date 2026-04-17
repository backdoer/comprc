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

PROMPT=$'%{$FG[039]%}%~%{$reset_color%}$(git_prompt_info) %{$FG[039]%}%(!.#.»)%{$reset_color%} '

eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[255]($FG[255]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# Ngrok
export PATH="$PATH:/usr/local/bin"

export AWS_PROFILE="veras-aws"
export VANTA_ENV_FILE="$HOME/.vanta_env"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Vi mode for zsh command line
bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
	if [[ $KEYMAP == vicmd ]]; then
		echo -ne "\e[2 q"   # Normal mode: block cursor
	else
		echo -ne "\e[1 q"   # Insert mode: beam cursor
	fi
}

function zle-line-init {
	echo -ne "\e[1 q"     # Start each prompt in insert mode with beam
}

bindkey -M vicmd 'H' vi-beginning-of-line   # H → 0
bindkey -M vicmd 'L' vi-end-of-line         # L → $
bindkey -M vicmd 'T' vi-first-non-blank     # T → ^

function _vi-yank-clip { zle vi-yank; printf '%s' "$CUTBUFFER" | pbcopy; }
zle -N _vi-yank-clip
bindkey -M vicmd 'y' _vi-yank-clip

zle -N zle-keymap-select
zle -N zle-line-init
