# Debug functions for git hooks.

if [ -n "${CHAIN_HOOKS_DEBUG}" ]; then
    function _hooks_debug_echo {
        echo >&2 "$@"
    }
else
    function _hooks_debug_echo {
        true
    }
fi

function _hooks_debug {
    _hooks_debug_echo "DEBUG:" "$@"
}

function _hooks_debug_tabbed {
    _hooks_debug_echo -n "DEBUG: "

    while [ -n "$1" ]; do
        _hooks_debug_echo -n "$1"
        if [ -n "$2" ]; then
            _hooks_debug_echo -n $'\t'
        fi
        shift
    done
    _hooks_debug_echo
}
