# source from ~/.bash_profile

THIS_DIR=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
PROFILE_DIR="${THIS_DIR}/profile"
SCRIPT_DIR="${THIS_DIR}/scripts"

export PATH=$PATH:$SCRIPT_DIR

if [[ `uname` == "Darwin" ]]; then
    export IS_MACOS=true
else
    export IS_MACOS=false
fi

function xwhich {
    which "$1" 2>&1 >/dev/null
}

if $IS_MACOS && ! xwhich brew; then
  if [ -x /opt/homebrew/bin ]; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi
fi

source "${PROFILE_DIR}/homebrew_emacs.sh"
source "${PROFILE_DIR}/functions.sh"
source "${PROFILE_DIR}/variables.sh"
source "${PROFILE_DIR}/aliases.sh"
source "${PROFILE_DIR}/envoy.sh"
source "${PROFILE_DIR}/set_include_dir.sh"
source "${PROFILE_DIR}/rbenv.sh"

if [[ -f "${PROFILE_DIR}/git-completion.bash" ]]; then
    source "${PROFILE_DIR}/git-completion.bash"
fi

if [[ -f "${PROFILE_DIR}/git-prompt.sh" ]]; then
    source "${PROFILE_DIR}/git-prompt.sh"

    BLUE=$(tput setaf 6)
    NC=$(tput sgr0)

    export PS1='\u@\h \W\['${BLUE}'\]$(__git_ps1 " (%s)")\['${NC}'\]\$ '

    unset BLUE NC
else
    export PS1='\u@\h \W\$ '
fi

unset xwhich
unset IS_MACOS
