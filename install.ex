#!/usr/bin/env bash

# Get Path to script folder
DIR="$( cd "$( dirname "$0" )" && pwd )"
# Fix path in case of symlinks
DIR=$(cd "$DIR" && pwd -P)


echo "Installing brew modules via 'brew.sh'"
sh ./brew.ex.sh
echo "'brew.sh' completed"

echo "Installing brew-cask modules via 'brew-cask.sh'"
sh ./brew-cask.ex.sh
echo "'brew-cask.sh' completed"

echo "Syncing  dotfiles"
sh ./sync.ex.sh

# Throw in a .localrc if needed
if [ ! -e $HOME/.localrc ]; then
	echo -e "# This is your own .localrc file for your SUPER SECRET STUFF" > $HOME/.localrc
fi

# Load up new bash profile
echo "Loading Bash Profile"
source ~/.bash_profile

# Sync and load zshrc
echo "Loading ZSH shell"
if [ ! -e $HOME/.zshrc]; then
  ln -s ./zsh/.zshrc $HOME/
  source ~/.zshrc
fi
