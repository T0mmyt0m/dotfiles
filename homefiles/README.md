# Bash Setup Script Documentation

## Overview
This script automates the setup of a user's Bash environment by:
- Checking for required packages (`git`, `curl`, and `wget`) and notifying the user if any are missing.
- Creating a symbolic link (or copying) the `.bash_aliases` file from the `~/dotfiles` repository to the user's home directory.
- Reminding the user to reload their Bash environment (`source ~/.bashrc`) or log out and back in for the changes to take effect.

## Files Involved
### `script.sh`
- A Bash script that automates the process of checking dependencies, managing `.bash_aliases`, and notifying the user about environment reloading.
- Ensures `.bash_aliases` is correctly linked to `~/dotfiles/.bash_aliases`, maintaining consistency between the dotfiles repository and the active shell environment.

### `.bash_aliases`
- A file containing user-defined aliases to improve command-line efficiency.
- Typically sourced in `.bashrc` to ensure aliases are available in all new terminal sessions.

## Usage
1. **Make the script executable:**
   ```bash
   chmod +x script.sh
   ```
2. **Run the script:**
   ```bash
   ./script.sh
   ```
3. **Reload Bash configuration:**
   ```bash
   source ~/.bashrc
   ```
   Or log out and log back in.

## Citation
This script and documentation were generated with assistance from [OpenAI's ChatGPT](https://chatgpt.com/auth/login) based on the following prompt:
> "Write a script that outputs to the user packages that need to be installed for their .bashrc file, copies or symbolically links the .bash_aliases file in their dotfiles repository to the user's home directory, and reminds the user to reload their environment."

Additionally, the method for retrieving a symlink target was referenced from [The Linux Code - Bash Script to Get Symlink Target](https://thelinuxcode.com/bash-script-get-symlink-target/).

Alias list reference guide from [awesome-bash-alias](https://github.com/vikaskyadav/awesome-bash-alias)
