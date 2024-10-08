Stephan's bash config
=====================

Yay.

General Configuration
---------------------

1. Put git SSH keys in ~/.ssh
2. Modify ~/.ssh/config to use them for github.com:
   ```
   Host github.com
       IdentityFile ~/.ssh/zuercher_github_rsa
   ```
3. Clone bash-personal:
   ```
   mkdir ~/personal && cd personal
   git clone git@github.com:zuercher/bash-personal.git
   ```
4. Configure bash:
   ```
   echo source ~/personal/bash-personal/bash_common.sh >>~/.bash_profile
   ```
5. Install Homebrew.
6. `brew install --cask emacs`

Mac Customizations
------------------

1. Shell... Open... open `configs/Personal.terminal`
2. Terminal... Settings... Profiles tab... select Personal profile
   and click Default.
3. Run `./configs/Shortcuts.sh` to add ⌘⌥← and ⌘⌥→ shortcuts
   for navigating Terminal tabs and so forth.
4. Run `./configs/disable_power_chime.sh` to disable the power chime
   sound when a power adapter is plugged in.

Git Customizations
------------------

If `bash-personal/profile/git-completion.bash` exists, it will be
sourced and is expected to provide git command line completion.

Similarly, if `bash-personal/profile/git-prompt.sh` exists, it is
sourced and expected to produce a `__git_ps1` function which is placed
in the shell prompt.

Both scripts are available from
https://github.com/git/git/blob/master/contrib/completion/ and can be
installed via `./configs/install_git_helpers.sh`.

Git Hooks
---------

The script `install-git-hooks` can install several types of git hooks.

