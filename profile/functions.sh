function f() {
    find . -name "$1" -print;
}

function fng() {
    find . -type f -a -name "$1" -print0 | xargs -0 grep "$2";
}

if [ -f "${HOME}/.local_functions.sh" ]; then
    source "${HOME}/.local_functions.sh"
fi
