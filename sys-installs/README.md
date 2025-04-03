# Homefiles
This repository contains a script that installs anaconda.

`Script.sh`: An installation script for Anaconda Python distribution on Debian-based Linux systems (Ubuntu, Kali Linux).

## Script Details
The `Script.sh` script automates Anaconda installation with several safety features:

Verifies root privileges before proceeding
Confirms system is using the APT package manager
Provides installation information and requires user confirmation
Checks for existing Anaconda or conda installations to prevent conflicts
Silently installs Anaconda and necessary dependencies
Sets up environment variables automatically
Provides verification command upon completion

## Usage
To use the script:
Make the script executable
`chmod +x Script.sh`

## Run with sudo privileges
`sudo ./Script.sh`

# Credits and Citations
This script was created with assistance from [ChatGPT](https://chatgpt.com/auth/login).

The prompt used was:

```"Help me create a script that installs anaconda ubuntu linux"```

## Helpful Resources

[Anaconda Documentation](https://www.anaconda.com/docs/getting-started/anaconda/install) - Official Anaconda installation and usage documentation.

[Bash Scripting Guide](https://linuxconfig.org/bash-scripting-tutorial) - Comprehensive guide for writing Bash scripts and understanding Linux scripting concepts.
