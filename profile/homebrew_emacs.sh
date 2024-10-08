# If emacs isn't on the path, but there's an Emacs.app, 
# find the emacs binary in Emacs.app and point an alias at it.

# check if homebrew is installed
if $IS_MACOS && xwhich brew && ! xwhich emacs; then
    # make an alias for emacs if installed
    EMACS_INSTALL_DIR=`brew --prefix emacs 2>/dev/null`
    EMACS="$EMACS_INSTALL_DIR/Emacs.app/Contents/MacOS/Emacs"
    if [ -n "$EMACS_INSTALL_DIR" -a -x "$EMACS" ]; then
        alias "emacs=$EMACS"
    fi
fi
