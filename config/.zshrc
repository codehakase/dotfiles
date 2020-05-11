# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export GO111MODULE=off
export GOFLAGS=-mod=vendor

export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Path to your oh-my-zsh installation.
export ZSH=/Users/codehakase/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="robbyrussell"


# autocomplete
ZSH_AUTOSUGGEST_USE_ASYNC=true


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
  git
)

source $ZSH/oh-my-zsh.sh

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

# Handle ssh-clients with passphrase
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# aliases
alias v=/usr/local/bin/nvim
alias dotsy="sh ~/dotfiles/sync"
alias nah="git reset --soft HEAD~1"
alias ga="git add"
alias gs="git status"
alias gaa="git add ."
alias gc="git commit -S -m "
alias gp="git push"
alias gpo="git push orign "
alias tm="tmux -2 -f ~/tmux.conf new -s"
alias ta="tmux attach"
alias td="tmux detach"
alias tk='tmux kill-session -t'
alias electron "~/node_modules/electron/cli.js"
alias ngrok="~/ngrok"
alias t="tail -f"
alias :q="exit"
alias cls="clear"

export PATH="$PATH:$HOME/.composer/vendor/bin"

# Spaceship custom settings
SPACESHIP_TIME_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false

# Kitty Term
autoload -Uz compinit
compinit
# Completion for kitty
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/codehakase/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/codehakase/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/codehakase/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/codehakase/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Set FZF's default search
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
eval "$(starship init zsh)"
ctags=/usr/local/bin/ctags
