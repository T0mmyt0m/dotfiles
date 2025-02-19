#!/bin/bash

# Define paths
VUNDLE_DIR=~/.vim/bundle/Vundle.vim
DOTFILES_DIR=~/dotfiles/vim-config
VIMRC_FILE=~/.vimrc

# Ensure the dotfiles directory exists
mkdir -p $DOTFILES_DIR

# Copy .vimrc to the home directory
cp $DOTFILES_DIR/.vimrc $VIMRC_FILE

# Install Vundle if not exists
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

# Ensure .vimrc contains the required plugins
if ! grep -q "Plugin 'tpope/vim-surround'" "$VIMRC_FILE"; then
    echo "Adding vim-surround plugin to .vimrc"
    cat <<EOL >> $VIMRC_FILE

" Surround.vim Plugin
Plugin 'tpope/vim-surround'
EOL
fi

# Install Vim Plugins
vim +PluginInstall +qall

echo "Vim configuration applied successfully!"
