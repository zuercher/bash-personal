if $IS_MACOS; then
    # mimic dircolors defaults in Linux
    export LSCOLORS='exgxFxdxCxBxBxHbadacec'
fi

# Auto-combine histories from across shells, appending to the history
# file at each prompt. Keep 10k lines per shell and 100k lines
# overall.
export HISTSIZE=10000
export HISTFILESIZE=100000
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"

# Disable per-bash session history.
if $IS_MACOS; then
    export SHELL_SESSION_HISTORY=0
fi
