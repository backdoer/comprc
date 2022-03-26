# If you come from bash you might have to change your $PATH.
	# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions brew macos colored-man-pages asdf jsontools)

# Path to your oh-my-zsh installation.
export ZSH=/Users/brianbolnick/.oh-my-zsh
export EDITOR='vim'
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="hyperzsh"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
	# sensitive completion must be off. _ and - will be interchangeable.
	# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
	# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
	# under VCS as dirty. This makes repository status check for large repositories
		# much, much faster.
		# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
	# stamp shown in the history command output.
	# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
	# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

zstyle ':omz:update' mode auto
#get_latest_package () { asdf list-all $1 | egrep '^[^a-zA-Z]+$' | sed -Ee 's/^(.*-)([0-9.]+)(\.ime)$/\2.-1 \1\2\3/' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | cut -d\  -f2- | tail -n 1 ; }

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
	# if [[ -n $SSH_CONNECTION ]]; then
		#   export EDITOR='vim'
		# else
			#   export EDITOR='mvim'
			# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Docker
alias dc="docker-compose"
alias d="docker"
alias dprune="docker system prune -a --volumes"

alias ls='ls -GF'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias cdw='foo(){ cd ~/workspace/"$1"}; foo '
alias rage='foo(){ rm -rf "$1"}; foo'
alias pid='foo(){ lsof -nP -i4TCP:"$1" | grep LISTEN }; foo'
alias newf='foo(){mkdir "$1"; vim "$1"/"$2"}; foo '
alias tattach='foo(){tmux a -t "$1"}; foo'
alias src='source ~/.zshrc'
alias vime='sudo vim ~/.vimrc'
alias rebase='gpm && git push origin HEAD'
alias awsume='. awsume'
alias am='foo(){ alembic revision --autogenerate -m "$1" }; foo'

phx() {
	source .env
	iex -S mix phx.server
}

alias phox='iex -S mix phoenix.server'
alias exto='ecto'
alias suck='yarn cache clean'
alias py="python3"
alias ngrok='foo(){ cdw && ./ngrok http "$1"}; foo'
alias loct='foo(){ lt --port "$1" --subdomain "$2"}; foo'

alias work='tmuxinator start emotive'
alias dev='tmuxinator start home'

# Git
alias gc="git checkout"
alias gs="git status"
alias gph="git push heroku master"
alias gpm="git pull origin main"
alias gp="git pull"
alias tmux="TERM=screen-256color-bce tmux"
alias gi="echo -e 'a\n*\nq\n'|git add -i"

function gc() {
	if [ "$1" != "" ] # or better, if [ -n "$1" ]
	then
		git commit -m "$1"
	else
		git commit -m update
	fi
}

function sendno() {
	git add --patch
	if [ "$1" != "" ] # or better, if [ -n "$1" ]
	then
		git commit -m "$1" --no-verify
	else
		git commit -m update --no-verify
	fi
	git push -u origin HEAD --no-verify
}


function send() {
	git add --patch
	if [ "$1" != "" ] # or better, if [ -n "$1" ]
	then
		git commit -m "$1"
	else
		git commit -m update
	fi
	git push -u origin HEAD
}

function sendp() {
	git add --patch
	if [ "$1" != "" ] # or better, if [ -n "$1" ]
	then
		git commit -m "$1"
	else
		git commit -m update
	fi
	git push -u origin HEAD && expo publish
}

autoload -U promptinit; promptinit
prompt pure

export CPATH=`xcrun --show-sdk-path`/usr/include

#export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/usr/local/sbin"
source ~/.bin/tmuxinator.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# chrome history fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
c() {
# c - browse chrome history
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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source /Users/brianbolnick/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/brianbolnick/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/brianbolnick/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/brianbolnick/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/brianbolnick/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

#. /usr/local/opt/asdf/libexec/asdf.sh

export PATH="$HOME/.poetry/bin:$PATH"

#. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/libexec/asdf.sh
