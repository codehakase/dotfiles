#!/bin/bash

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# Brew maintainace
brew update && brew cleanup

brew install node

## Makes adding SSH keys to servers easier.
brew install ssh-copy-id

#brew install docker boot2docker
#brew install boot2docker

# Install kubernetes
brew install kubernetes-cli

brew install gcc
brew install git
brew install gpg
brew install openssh
brew install tmux
brew install go
brew install node

# Cli tools
brew install tree
brew install wget
brew install nmap

brew install zsh

# Brew maintainace
brew update && brew outdated

# Cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

exit 0
