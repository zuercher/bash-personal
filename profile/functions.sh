function fuck() {
    case "$1" in
        yeah|yeah\!)
            echo "🤘"
            ;;
        you|you\!)
            echo "Easy, turbo."
            ;;
        "")
            responses=(
                "Have you tried turning it off and back on again?"
                "Let's not and say we did."
                "\033[107m 🦆 \033[0m"
                "\033[107m      \033[0m\n\033[107m🖕🕺🖕\033[0m\n\033[107m      \033[0m"
                "Play stupid games, win stupid prizes."
            )

            size="${#responses[@]}"
            index="$((${RANDOM} % ${size}))"
            echo -e "${responses[$index]}"
            ;;
        *)
            echo "No, you fuck" "$@"
            ;;
    esac
}

# remove extension from a file
function noext() {
    local F="$1"
    if [[ "${F}" =~ .+(\....)$ ]]; then
        local EXT="${BASH_REMATCH[1]}"
        echo "${F/%${EXT}/}"
    else
        echo "${F}"
    fi
}

if [ -f "${HOME}/.local_functions.sh" ]; then
    source "${HOME}/.local_functions.sh"
fi
