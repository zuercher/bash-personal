if $IS_MACOS; then
    # mimic dircolors defaults in Linux
    export LSCOLORS='exgxFxdxCxBxBxHbadacec'

    if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
        export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
        export MANPATH="$MANPATH:/usr/local/opt/coreutils/libexec/gnuman"
    fi
fi

# configure hh, if available
if command -v hh >/dev/null 2>&1; then
    export HH_CONFIG=hicolor         # get more colors
    shopt -s histappend              # append new history items to .bash_history
    export HISTCONTROL=ignorespace   # leading space hides commands from history
    export HISTFILESIZE=10000        # increase history file size (default is 500)
    export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
    export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync

    # if this is interactive shell...
    if [[ $- =~ .*i.* ]]; then
        # bind hh to Ctrl-r (for Vi mode check doc)
        bind '"\C-r": "\C-a hh -- \C-j"'
        # bind 'kill last command' to Ctrl-x k
        bind '"\C-xk": "\C-a hh -k \C-j"'
    fi
fi
