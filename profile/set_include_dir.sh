# Point OS_INCLUDE_DIR at XCode's /usr/include, since I can never remember this location on the Mac
OS=`uname -s`

if [ "$OS" = "Darwin" ]; then
    MAC_SDKS="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs"
    if [ -d "$MAC_SDKS" ]; then
        INCLUDE_DIR="${MAC_SDKS}/MacOSX.sdk/usr/include"
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
