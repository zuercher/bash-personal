#!/usr/bin/env bash

# Adapted from https://betterdev.blog/minimal-safe-bash-script-template/

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
prog_name=$(basename "${BASH_SOURCE[0]}")

# TEMPLATE: document flags
usage() {
    cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

Script description here.

Available options:

-f, --flag      Some flag description
-p, --param     Some param description
-h, --help      Print this help and exit
    --no-color  Disable color output (or set NO_COLOR)
-v, --verbose   Print script debug info
EOF
  exit
}

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
    # TEMPLATE: script cleanup here
}

setup_colors() {
    if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
        NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m'
        BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
    else
        NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
    fi
}

err() {
    echo -e "${@}"
}

verbose() {
    [[ "${verbose-0}" != "0" ]] && echo -e "${@}"
}

die() {
    local msg=$1
    local code=${2-1} # default exit status 1
    err "$msg"
    exit "$code"
}

parse_params() {
    # TEMPLATE: default values of variables set from params
    flag=0
    param=''
    verbose=0

    while :; do
        case "${1-}" in
            -h | --help) usage ;;
            -v | --verbose) verbose=$((verbose+1)) ;;
            --no-color) NO_COLOR=1 ;;
            # TEMPLATE: handle flags
            -f | --flag) flag=1 ;; # example flag
            -p | --param) # example named parameter
                param="${2-}"
                shift
                ;;
            -?*) die "${prog_name}: unknown option: $1" ;;
            *)
                # TEMPLATE: handle trailing args (switch to die for no trailing args)
                # die "${prog_name}: unknown argument: $1"
                break
                ;;
        esac
        shift
    done

    # TEMPLATE: store trailing args
    args=("$@")

    # TEMPLATE: check required params and arguments
    [[ -z "${param-}" ]] && die "${prog_name}: missing required parameter: param"
    [[ ${#args[@]} -eq 0 ]] && die "${prog_name}: missing script arguments"

    [[ ${verbose} -gt 1 ]] && set -x

    return 0
}

parse_params "$@"
setup_colors

# TEMPLATE: script logic here
err "${RED}Read parameters:${NOFORMAT}"
err "- flag: ${flag}"
err "- param: ${param}"
err "- arguments: ${args[*]-}"
verbose "verbose enabled"
