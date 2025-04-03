#!/bin/bash

# Script to install Anaconda on Ubuntu Linux

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run with sudo or as root."
    exit 1
fi

# Check if apt is available
if ! command -v apt &> /dev/null; then
    echo "This script requires the apt package manager. Please use an Ubuntu-based system."
    exit 1
fi

# Provide information and get confirmation
echo "This script will install Anaconda Python Distribution and its dependencies."
echo "Would you like to proceed? (y/n)"
read -r response

if [[ ! "$response" =~ ^[yY]$ ]]; then
    echo "Installation canceled."
    exit 0
fi

# Check if 'conda' or 'anaconda' commands already exist
if command -v conda &> /dev/null || command -v anaconda &> /dev/null; then
    echo "A command named 'conda' or 'anaconda' already exists on this system. Exiting to avoid conflicts."
    exit 1
fi

# Install dependencies - Updated package list
apt update -q
apt install -y wget libgl1 libegl1 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# Get the latest Anaconda version
ANACONDA_VERSION="2023.09-0"
INSTALLER="Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh"

# Install Anaconda silently
echo "Installing Anaconda..."
wget -q https://repo.anaconda.com/archive/${INSTALLER}
bash ${INSTALLER} -b -p /opt/anaconda3
rm ${INSTALLER}

# Set up environment variables
echo 'export PATH="/opt/anaconda3/bin:$PATH"' > /etc/profile.d/anaconda.sh
chmod +x /etc/profile.d/anaconda.sh

# Notify user
echo "Anaconda installation complete. Try running 'conda --version' to verify the installation (you may need to restart your shell or run 'source /etc/profile.d/anaconda.sh' first)."

exit 0
