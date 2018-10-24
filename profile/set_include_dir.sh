if $IS_MACOS; then
    XCODE_PATH=`xcode-select -p`
    if [ ! -d "${XCODE_PATH}" ]; then
        XCODE_PATH="/Applications/Xcode.app"
        if [ ! -d "${XCODE_PATH}" ]; then
            echo "Not setting OS_INCLUDE_DIR: cannot find Xcode at ${XCODE_PATH}"
            return
        fi
    fi

    MAC_SDKS="${XCODE_PATH}/Platforms/MacOSX.platform/Developer/SDKs"
    if [ ! -d "${MAC_SDKS}" ]; then
        echo "Not setting OS_INCLUDE_DIR: ${MAC_SDKS} does not exist. (Is Xcode installed?)"
    else
        INCLUDE_DIR="${MAC_SDKS}/MacOSX.sdk/usr/include"
        if [ -d "${INCLUDE_DIR}" ]; then
            export OS_INCLUDE_DIR="${INCLUDE_DIR}"
        else
            echo "Not setting OS_INCLUDE_DIR: ${INCLUDE_DIR} does not exist."
        fi
    fi
else
    export OS_INCLUDE_DIR="/usr/include"
fi
