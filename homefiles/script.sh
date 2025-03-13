#!/bin/bash

# Define required packages
REQUIRED_PACKAGES=(git curl wget)

# Check and output missing packages
MISSING_PACKAGES=()
for pkg in "${REQUIRED_PACKAGES[@]}"; do
    if ! command -v "$pkg" &> /dev/null; then
        MISSING_PACKAGES+=("$pkg")
    fi
done

if [ ${#MISSING_PACKAGES[@]} -ne 0 ]; then
    echo "The following packages need to be installed: ${MISSING_PACKAGES[*]}"
    echo "Install them using your package manager (e.g., apt, yum, dnf, pacman)."
else
    echo "All required packages are already installed."
fi

# Set paths
DOTFILES_DIR=~/dotfiles
BASH_ALIASES_SRC="$DOTFILES_DIR/.bash_aliases"
BASH_ALIASES_DEST=~/.bash_aliases

# Copy or create symbolic link for .bash_aliases
if [ -f "$BASH_ALIASES_DEST" ] || [ -L "$BASH_ALIASES_DEST" ]; then
    echo "~/.bash_aliases already exists. Removing old version."
    rm -f "$BASH_ALIASES_DEST"
fi

ln -s "$BASH_ALIASES_SRC" "$BASH_ALIASES_DEST"

echo "Symbolic link created: ~/.bash_aliases -> $BASH_ALIASES_SRC"

# Remind the user to reload their environment
echo "To apply changes, please run:"
echo "  source ~/.bashrc"
echo "Or log out and log back in."
