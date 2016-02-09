# source from ~/.bash_profile

SCRIPT_DIR=$(cd `dirname ${BASH_SOURCE[0]}`/scripts; pwd)

export PATH=$PATH:$SCRIPT_DIR

# check if homebrew is installed
if which brew >/dev/null; then
    # make an alias for emacs if installed
    EMACS_INSTALL_DIR=`brew --prefix emacs 2>/dev/null`
    EMACS="$EMACS_INSTALL_DIR/Emacs.app/Contents/MacOS/Emacs"
    if [ -n "$EMACS_INSTALL_DIR" -a -x "$EMACS" ]; then
        alias "emacs=$EMACS"
    fi
fi

function f() {
    find . -name "$1" -print;
}

function fng() {
    find . -type f -a -name "$1" -print0 | xargs -0 grep "$2";
}
