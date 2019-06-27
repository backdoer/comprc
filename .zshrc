# If you come from bash you might have to change your $PATH.
	# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git zsh-autosuggestions brew osx colored-man-pages
)

source $ZSH/oh-my-zsh.sh

get_latest_package () { asdf list-all $1 | egrep '^[^a-zA-Z]+$' | sed -Ee 's/^(.*-)([0-9.]+)(\.ime)$/\2.-1 \1\2\3/' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | cut -d\  -f2- | tail -n 1 ; }

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

phx() {
	source .env
	iex -S mix phx.server
}

alias phox='iex -S mix phoenix.server'

alias suck='yarn cache clean'

alias podium='tmuxinator start podium'
alias dev='tmuxinator start home'
alias podium-edit='tmuxinator open podium'
# Git
alias go="git checkout"
alias gs="git status"
alias gph="git push heroku master"
alias gpm="git pull origin master"
alias gp="git pull"
#Podium Aliases
bm(){
	cdw black_mamba
  git pull
	source .env
	mix deps.get
	mix ecto.migrate
	iex -S mix phx.server
}
ah(){
	cdw akron_hammer
  git pull
	source .env
	mix deps.get
	iex -S mix phx.server
}

mk(){
	cdw magic
  git pull
	source .env
	mix deps.get
	iex -S mix phx.server
}
pi(){
	cdw podium-ui
	git pull
	yarn
	yarn storybook
}
pc(){
	cdw podium-charts
	git pull
	yarn
	yarn storybook
}
ngrok(){
	cd
	./ngrok http --subdomain bolnick-mamba 4000
}
ka(){
	cdw kazaam
	git pull
	source .env
	yarn install
	yarn start
}
db(){
	cdw dashboard-frontend
	git pull
	npm install
	nf start dev
}
sc(){
	cdw stormcrow
  git pull
	mix deps.get
	npm install
	mix phoenix.server
}
rr(){
	cdw review_rocket
	git pull
	bundle install
	rake db:migrate
	lsof -i:3000 | awk '{if(NR>1) print $2}' |  while read line; do kill -9 $line; done
	bundle exec rails s
}
rp(){
	cdw rapidash
	git pull
	npm install
	mix deps.get
	iex -S mix phoenix.server
}
sn(){
	cdw snowden
	git pull
	source .env
	mix deps.get
	iex -S mix phx.server
}
hb(){
	cdw platform
	gpm
	dc ps
}
ph(){
	cdw phyllis
	git pull
	mix deps.get
	iex -S mix phoenix.server
}
nv(){
	cdw navi
	git pull
	make deps
	source .env
	make server
}
lk(){
	cdw link
	git pull
	source .env
	mix deps.get
	iex -S mix phx.server
}
wclient(){
	cdw training/hippo_client
	gpm
	yarn start
}
wserver(){
	cdw training/hippo_api
	gpm
	iex -S mix phx.server
}
wnative(){
	cdw training/hippo_native
	gpm
	yarn start
}
client(){
	cdw hippo_client
	gpm
	yarn start
}
server(){
	cdw hippo_api
	gpm
	iex -S mix phx.server
}
native(){
	cd local_dev/hippo_native
	gpm
	yarn start
}

function gc() {
	if [ "$1" != "" ] # or better, if [ -n "$1" ]
	then
		git commit -m "$1"
	else
		git commit -m update
	fi
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
export PATH="$PATH:/usr/local/opt/node@8/bin"
export PATH="/usr/local/Cellar/rabbitmq/3.7.7_1/sbin:$PATH"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
export PATH="/usr/local/sbin:$PATH"
source ~/.bin/tmuxinator.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source /Users/brianbolnick/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
