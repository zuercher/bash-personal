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

OS=`uname -s`

# Point OS_INCLUDE_DIR at /usr/include, since I can never remember this location on the Mac
if [ "$OS" = "Darwin" ]; then
    MAC_SDKS="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs"
    if [ -d "$MAC_SDKS" ]; then
        VERSION=`ls -1 "$MAC_SDKS" | tail -n 1`
        INCLUDE_DIR="${MAC_SDKS}/${VERSION}/usr/include"
        if [ -d "$INCLUDE_DIR" ]; then
            export OS_INCLUDE_DIR="$INCLUDE_DIR"
        else
            echo "Not setting OS_INCLUDE_DIR; $INCLUDE_DIR does not exist."
        fi
    else
        echo "Not setting OS_INCLUDE_DIR; ${MAC_SDKS} does not exist. (Is Xcode installed?)"
    fi
else
    export OS_INCLUDE_DIR="/usr/include"
fi

alias sum='math sum'
alias avg='math avg'
