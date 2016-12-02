#/bin/bash

# First symlink neovim
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

# Symlink tmux.conf
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
