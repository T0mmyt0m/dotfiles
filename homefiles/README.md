# Bash Completion Script Documentation

## Overview
This script automates the detection and installation of `bash-completion`, a package that enables advanced tab completion for commands such as `git` and etc. It checks whether `bash-completion` is installed, prompts the user to install it if missing, and reminds them to reload their environment for changes to take effect.

## Features
- **Checks if `bash-completion` is installed** before prompting for installation.
- **Prompts the user** for installation (`y/n` confirmation) if the package is missing.
- **Automatically installs `bash-completion`** if the user agrees.
- **Rechecks installation success** after installation attempt.
- **Provides manual installation instructions** if installation fails.
- **Reminds the user to reload their environment** (`source ~/.bashrc` or log out and back in).

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

### 7. Remind the User to Reload Their Environment
```bash
echo "To apply changes, please reload your environment:"
echo "  - Run: source ~/.bashrc"
echo "  - Or log out and log back in"
```
After installation, the script **reminds the user** to reload their environment to activate `bash-completion`.

## Usage Instructions
1. **Run the script**:
   ```bash
   ./bash-completion.sh
   ```
2. If `bash-completion` is missing, the script prompts:
   ```
   The following package is missing and may be required for full functionality of your .bashrc:
     - bash-completion: Enables advanced tab completion for commands like git, docker, etc.
   Would you like to install it now? (y/n):
   ```
3. If the user selects **`y`**, the script installs `bash-completion` and confirms installation.
4. If the user selects **`n`**, it suggests a manual installation command.
5. After installation, the script **reminds the user** to reload their environment:
   ```
   To apply changes, please reload your environment:
     - Run: source ~/.bashrc
     - Or log out and log back in
   ```

## Verification
After running the script, verify that `bash-completion` works by running:
```bash
type _init_completion
```
If installed correctly, it should return:
```
_init_completion is a function
```
## Sources
 - https://github.com/vikaskyadav/awesome-bash-alias - for the "awesome-bash-alias" lists.
 - https://opensource.com/article/18/3/creating-bash-completion-script - walkthrough on making the script.
