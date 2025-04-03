Homefiles
This repository contains scripts and configuration files for Linux system administration and environment setup.
Contents

anaconda_install.sh: An installation script for Anaconda Python distribution on Debian-based Linux systems (Ubuntu, Kali Linux).

Script Details
The anaconda_install.sh script automates Anaconda installation with several safety features:

Verifies root privileges before proceeding
Confirms system is using the APT package manager
Provides installation information and requires user confirmation
Checks for existing Anaconda or conda installations to prevent conflicts
Silently installs Anaconda and necessary dependencies
Sets up environment variables automatically
Provides verification command upon completion

Usage
To use the script:
bashCopy# Make the script executable
chmod +x anaconda_install.sh

# Run with sudo privileges
sudo ./anaconda_install.sh
Credits and Citations
This script was created with assistance from Claude (Anthropic).
The prompt used was:
"For this task, you are going to do every admin's favorite thing - install software! The below software should require multiple commands to install between dependencies and the software itself.

Pick one of the following packages in install for Ubuntu Linux:

Singularity
Ansible
Anaconda
CUDA
AWS Command Line Interface Write a script that

checks the effective user id (EUID) - if running as root the script may proceed, otherwise it exits and prompts the user that this script requires sudo or root
checks that the system package manager is apt (or apt is available on the system), otherwise it exits and prompts the user that this script uses the apt package manager
provides the user with information on what will be installed - allows the user to provide y for yes and proceeds or n for no and exits
checks if name of software or software (not each of its dependencies) exists - exits if software is found (or if software name is taken) and prompts the user that a name conflict occurred
silently installs the software selected per instructions
prompts the user that install is complete and a command to run to try it"





Helpful Resources

Anaconda Documentation - Official Anaconda installation and usage documentation
Bash Scripting Guide - Comprehensive guide for writing Bash scripts and understanding Linux scripting concepts
