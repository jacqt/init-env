#!/bin/bash

# Install tmux
sudo apt-get install tmux

# Get tmux conf
wget https://gist.githubusercontent.com/jacqt/8dac0b8f24bbd47a10cfa7548132b095/raw/96f3da76c303d9046584b1675d0e0249643e345b/.tmux.conf

# Get vim conf
wget https://gist.githubusercontent.com/jacqt/b3c2d1dd1a320d33ce609208ba34ff48/raw/59b500ecf444f506ab59dcf9c5a653750fd4715b/.vimrc

# Get zshrc
wget https://gist.githubusercontent.com/jacqt/b27d4aaf3ffbb8cdbf2e7e6bb282e91c/raw/6452b701848088bb1e4ba545bbed1b93116b1026/.zshrc

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
