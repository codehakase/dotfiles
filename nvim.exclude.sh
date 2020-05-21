#!/bin/bash

# Download vim plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
	curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Sync nvimrc file
if [ ! -d $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config/nvim
	ln -s $PWD/vim/nvimrc $HOME/.config/nvim/init.vim
else
	if [ ! -e $HOME/.config/nvim/init.vim ]; then
		rm $HOME/.config/nvim/init.vim
	fi
	ln -s $PWD/vim/nvimrc $HOME/.config/nvim/init.vim
fi
