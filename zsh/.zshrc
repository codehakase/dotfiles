# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.bash_profile
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
export GO111MODULE=on
export GOFLAGS=-mod=mod

export HOMEBREW_NO_AUTO_UPDATE=1

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"


# autocomplete
ZSH_AUTOSUGGEST_USE_ASYNC=true

plugins=(
  git
  zsh-autosuggestions
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# Handle ssh-clients with passphrase
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# aliases
alias ngrok="~/ngrok"
alias v=/usr/local/bin/nvim
alias dotsy="sh ~/.dotfiles/sync.ex"
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
alias dev="cd ~/Dev/"
alias tconf="v ~/tmux.conf"
alias vc="v ~/.config/nvim/init.vim"
alias rb="~/.rbenv/shims/ruby"
alias rs="~/.rbenv/shims/rails"

# Spaceship custom settings
SPACESHIP_TIME_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false

# Set FZF's default search
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/francissunday/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/francissunday/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/francissunday/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/francissunday/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
