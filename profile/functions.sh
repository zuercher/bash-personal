function fuck() {
    case "$1" in
        yeah|yeah!)
            echo "🤘"
            ;;
        you|you!)
            echo "Easy, turbo."
            ;;
        *)
            echo "No, you fuck" "$@"
            ;;
    esac
}

if [ -f "${HOME}/.local_functions.sh" ]; then
    source "${HOME}/.local_functions.sh"
fi
