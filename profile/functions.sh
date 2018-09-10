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

    CHECK_FMT="$ROOT"/tools/check_format.py
    if [ ! -f "$CHECK_FMT" ]; then
        echo "$CHECK_FMT: no such file "
        return 1
    fi

    if [ "$#" -lt 1 ]; then
        echo "Fixing format on all files reports by git status as added or modified:"
        cd "$ROOT"
        git status --porcelain=v1 | grep -E "^[MARC ][M ]" | awk '{print $NF}' | while read FILE; do
            echo "  $FILE"
            env BUILDIFIER="buildifier" "$CHECK_FMT" fix "$FILE"
        done
    else
        env BUILDIFIER="buildifier" "$CHECK_FMT" fix "$@"
    fi
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
