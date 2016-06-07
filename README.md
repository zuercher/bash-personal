Stephan's bash config
=====================

Yay.

    git clone github.com/zuercher/bash-personal
    cd bash-personal
    echo "source $PWD/bash_common.sh" >>~/.bash_profile

You get the idea.

Git Completion and Prompting
----------------------------

If `bash-personal/profile/git-completion.bash` exists, it will be
configured for git command line completion.

Similarly, if `bash-personal/profile/git-prompt.sh` exists, it will be
used to place the current git branch in the shell prompt.

Both scripts are available from:
https://github.com/git/git/blob/master/contrib/completion/
