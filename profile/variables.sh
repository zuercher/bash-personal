if $IS_MACOS; then
    # mimic dircolors defaults in Linux
    export LSCOLORS='exgxFxdxCxBxBxHbadacec'

    if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
        export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
        export MANPATH="$MANPATH:/usr/local/opt/coreutils/libexec/gnuman"
    fi
fi
