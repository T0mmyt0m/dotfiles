# `.bashrc` Setup Script Documentation

## **Overview**
This script automates the setup of a customized `.bashrc` file by:
1. Checking for required packages and informing the user if any are missing.
2. Backing up the existing `.bashrc` file.
3. Creating a symbolic link to the `.bashrc` file stored in a dotfiles repository.
4. Reminding the user to reload their shell for changes to take effect.

---

## **Script Steps & Explanation**

### **Check for Missing Packages**
- The script defines required packages:  
  ```bash
  REQUIRED_PKGS=("git" "curl" "bash-completion")
  ```
- It then **checks if they are installed** using:
  ```bash
  if ! command -v "$pkg" &>/dev/null; then
  ```
- If any package is missing, it prints a **warning**:
  ```bash
  Warning: The following packages are missing and may be required for full functionality:
  bash-completion
  Please install them manually using:
  sudo apt-get install bash-completion
  ```
-  **Purpose:** Ensures the user knows what dependencies are needed without installing them automatically.

---

### ** Define Dotfiles Repository Location**
- The script expects the dotfiles repository to be located at:
  ```bash
  DOTFILES_REPO="$HOME/dotfiles"
  ```
- If the directory **does not exist**, it prints an error and exits:
  ```bash
  if [ ! -d "$DOTFILES_REPO" ]; then
      echo "Error: Dotfiles repository not found at $DOTFILES_REPO"
      exit 1
  fi
  ```
-  **Purpose:** Ensures the `.bashrc` file is available in a known location before proceeding.

---

### ** Backup Existing `.bashrc`**
- If a `.bashrc` file already exists, it gets renamed to `.bashrc.bak`:
  ```bash
  if [ -f "$HOME/.bashrc" ]; then
      mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
      echo "Existing .bashrc backed up as .bashrc.bak"
  fi
  ```
-  **Purpose:** Prevents overwriting the existing `.bashrc` in case the user needs to restore it.

---

### ** Create a Symbolic Link**
- A **symlink** is created, linking the dotfiles `.bashrc` to the home directory:
  ```bash
  ln -s "$DOTFILES_REPO/.bashrc" "$HOME/.bashrc"
  ```
- After this step, running:
  ```bash
  ls -la ~ | grep .bashrc
  ```
  Should output something like:
  ```
  lrwxrwxrwx  1 user user   30 Mar 12 12:01 .bashrc -> /home/user/dotfiles/.bashrc
  ```
-  **Purpose:** This ensures that changes in the dotfiles repository are automatically reflected in the user's shell.

---

### ** Remind the User to Reload the Shell**
- Finally, the script prints a reminder:
  ```bash
  echo "Please run 'source ~/.bashrc' or restart your terminal for changes to take effect."
  ```
- This ensures the new `.bashrc` is applied **without restarting the system**.

---

## **Expected Script Behavior**
| Step | Action | Expected Output |
|------|--------|----------------|
|  1 | Check for missing packages | Warning message if missing packages are found |
|  2 | Verify dotfiles repository | Error if not found |
|  3 | Backup existing `.bashrc` | `.bashrc` is renamed to `.bashrc.bak` |
|  4 | Create symbolic link | `.bashrc` now points to dotfiles version |
|  5 | Prompt user to reload shell | Message to run `source ~/.bashrc` |

---

## **How to Run the Script**
### ** Save the Script**
```bash
nano setup_bashrc.sh
```
Paste the script inside and save (`CTRL + X`, then `Y`, then `Enter`).

### ** Make It Executable**
```bash
chmod +x setup_bashrc.sh
```

### ** Execute the Script**
```bash
./setup_bashrc.sh
```

### ** Verify Changes**
- Check if `.bashrc` is linked correctly:
  ```bash
  ls -la ~ | grep .bashrc
  ```
- Reload `.bashrc` without restarting:
  ```bash
  source ~/.bashrc
  ```
- Test if aliases and settings are working:
  ```bash
  alias ll
  echo $EDITOR
  ```

---

## **Troubleshooting**
| Issue | Solution |
|--------|----------|
| "Missing package warning" | Install the package manually using `sudo apt-get install <package>` |
| "Dotfiles repository not found" | Create it: `mkdir -p ~/dotfiles` |
| "Symbolic link not working" | Delete and recreate: `rm ~/.bashrc && ln -s ~/dotfiles/.bashrc ~/.bashrc` |
| `.bashrc` not applying | Run `source ~/.bashrc` or restart your terminal |

---

## **Final Notes**
- This script **does not install missing packages**, only **notifies the user**.
- It ensures that your `.bashrc` is safely backed up and linked to a central dotfiles repository.
- Changes take effect after running `source ~/.bashrc`.

