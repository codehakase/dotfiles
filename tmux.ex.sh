#!/bin/bash

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" --quiet
	if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
		tmux source-file "$HOME/.tmux.conf"
	fi
fi

# Sync and load tmux config
if [ ! -e $HOME/.tmux.conf ]; then
  ln -s ./tmux/.tmux.conf $HOME/
fi
