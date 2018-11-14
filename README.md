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

Mac Customizations
------------------

1. File... Import... open `configs/Personal.terminal`, and set config
   as default.
2. Run `./configs/TerminalShortcuts.sh` to add ⌘⌥← and ⌘⌥→ shortcuts
   for navigating Terminal tabs.

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

