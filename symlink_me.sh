#/bin/bash

# Install Vundle
mkdir ~/.vim/bundle -p
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# symlink neovim
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim

# First symlink neovim
ln -s $(pwd)/.vimrc $HOME/.vimrc
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

# Symlink tmux.conf
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf

# Get alias manager
git clone https://github.com/jacqt/jarvis4.git ~/github/jarvis4
cd ~/github/jarvis4
make zsh

# Symlink tmux.conf
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf

# Symlink jarvis config
rm -rf $HOME/.jarvis_config/main
ln -s $(pwd)/.jarvis_config/main $HOME/.jarvis_config/main
