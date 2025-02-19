#!/bin/bash

# Define paths
VUNDLE_DIR=~/.vim/bundle/Vundle.vim
DOTFILES_DIR=~/dotfiles/vim-config

# Copy .vimrc to home directory
cp $DOTFILES_DIR/.vimrc ~/

# Install Vundle if not exists
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

# Install Vim Plugins
vim +PluginInstall +qall

echo "Vim configuration applied successfully!"

