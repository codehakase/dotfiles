#!/usr/bin/env bash

echo "synching dotfiles to vcs..."

now=`date '+%y-%m-%d'`

if [ ! -d "$HOME/.dotfiles" ]; then
  cd ~/dotfiles
else
  cd ~/.dotfiles
fi

git add .
git commit -m "Auto Syncing dotfiles.... $now"
git push
