#!/bin/bash

REQUIRED_PKG="bash-completion"
PKG_PURPOSE="bash-completion: Enables advanced tab completion for commands like git, docker, etc."

check_package() {
    if [[ -f /usr/share/bash-completion/bash_completion ]] || dpkg -l | grep -qw bash-completion; then
        echo "bash-completion is already installed. You are good to go."
    else
        echo "The following package is missing and may be required for full functionality of your .bashrc:"
        echo "  - $PKG_PURPOSE"
        read -p "Would you like to install it now? (y/n): " choice
        if [[ "$choice" =~ ^[Yy]$ ]]; then
            sudo apt-get update && sudo apt-get install -y $REQUIRED_PKG
            
            if [[ -f /usr/share/bash-completion/bash_completion ]] || dpkg -l | grep -qw bash-completion; then
                echo "bash-completion successfully installed. You are good to go."
            else
                echo "Installation failed. Please install manually using:"
                echo "  sudo apt-get install $REQUIRED_PKG"
            fi
        else
            echo "Skipping installation. You may install it manually using:"
            echo "  sudo apt-get install $REQUIRED_PKG"
        fi
    fi
}

check_package

echo "To apply changes, please reload your environment:"
echo "  - Run: source ~/.bashrc"
echo "  - Or log out and log back in"
