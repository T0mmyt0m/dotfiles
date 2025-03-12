# Bash Completion Setup Script Documentation

## Overview
This script automates the detection and installation of `bash-completion`, a package that enables advanced tab completion for commands such as `git`, `docker`, and others. It checks whether `bash-completion` is installed and prompts the user to install it if missing.

## Features
- **Checks if `bash-completion` is installed** before prompting for installation.
- **Prompts the user** for installation (`y/n` confirmation) if the package is missing.
- **Automatically installs `bash-completion`** if the user agrees.
- **Rechecks installation success** after installation attempt.
- **Provides manual installation instructions** if installation fails.

## Script Breakdown

### 1. Define Required Package
```bash
REQUIRED_PKG="bash-completion"
PKG_PURPOSE="bash-completion: Enables advanced tab completion for commands like git, docker, etc."
```
This specifies the package to be checked and its purpose.

### 2. Check for Existing Installation
```bash
if [[ -f /usr/share/bash-completion/bash_completion ]] || dpkg -l | grep -qw bash-completion; then
    echo "bash-completion is already installed."
```
The script checks if `bash-completion` is installed by:
- Looking for its presence in `/usr/share/bash-completion/bash_completion`
- Checking the installed package list with `dpkg -l`

### 3. Prompt for Installation
```bash
read -p "Would you like to install it now? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
```
If `bash-completion` is missing, the script asks the user whether they want to install it.

### 4. Install the Package
```bash
sudo apt-get update && sudo apt-get install -y $REQUIRED_PKG
```
If the user confirms (`y`), the script updates package lists and installs `bash-completion`.

### 5. Verify Installation
```bash
if [[ -f /usr/share/bash-completion/bash_completion ]] || dpkg -l | grep -qw bash-completion; then
    echo "bash-completion successfully installed."
```
After installation, it rechecks whether `bash-completion` was successfully installed.

### 6. Manual Installation Instruction (If Needed)
```bash
else
    echo "Installation failed. Please install manually using:"
    echo "  sudo apt-get install $REQUIRED_PKG"
```
If the installation fails, the script suggests a manual installation method.

## Usage Instructions
1. **Run the script**:
   ```bash
   ./bashrc_setup_script.sh
   ```
2. If `bash-completion` is missing, the script prompts:
   ```
   The following package is missing and may be required for full functionality of your .bashrc:
     - bash-completion: Enables advanced tab completion for commands like git, docker, etc.
   Would you like to install it now? (y/n):
   ```
3. If the user selects **`y`**, the script installs `bash-completion` and confirms installation.
4. If the user selects **`n`**, it suggests a manual installation command.

## Verification
After running the script, verify that `bash-completion` works by running:
```bash
type _init_completion
```
If installed correctly, it should return:
```
_init_completion is a function
```


