#!/bin/bash

## Assumes clisp, tmux, vim, and git are installed

cd ~/

## wget -O {URL} overwrites existing files

# Get tmux conf
wget -O https://github.com/jacqt/init-env/raw/master/.tmux.conf

# Get vim conf
wget -O https://github.com/jacqt/init-env/raw/master/.vimrc

# Get zshrc
wget -O https://github.com/jacqt/init-env/raw/master/.zshrc

# Install Vundle
mkdir ~/.vim/bundle -p
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall

# Get alias manager
mkdir ~/github
git clone https://github.com/jacqt/jarvis4.git ~/github/jarvis4
cd ~/github/jarvis4
make zsh

