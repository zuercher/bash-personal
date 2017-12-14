function f() {
    find . -name "$1" -print;
}

function fng() {
    find . -type f -a -name "$1" -print0 | xargs -0 grep "$2";
}

function envoy_fix_format() {
    local ROOT=$(git rev-parse --show-toplevel)
    if [ -z "$ROOT" ]; then
        return 1
    fi

    if [ ! -d "$ROOT" ]; then
        echo "not a directory: $ROOT"
        return 1
    fi

    env BUILDIFIER="buildifier" "$ROOT"/tools/check_format.py fix "$@"
}

function envoy_check_format() {
    local ROOT=$(git rev-parse --show-toplevel)
    if [ -z "$ROOT" ]; then
        return 1
    fi

    if [ ! -d "$ROOT" ]; then
        echo "not a directory: $ROOT"
        return 1
    fi

    env BUILDIFIER="buildifier" "$ROOT"/tools/check_format.py check "$@"
}
