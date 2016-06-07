# source from ~/.bash_profile

THIS_DIR=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
PROFILE_DIR="${THIS_DIR}/profile"
SCRIPT_DIR="${THIS_DIR}/scripts"

export PATH=$PATH:$SCRIPT_DIR

source "${PROFILE_DIR}/homebrew_emacs.sh"
source "${PROFILE_DIR}/functions.sh"
source "${PROFILE_DIR}/aliases.sh"
source "${PROFILE_DIR}/set_include_dir.sh"

if [[ -f "${PROFILE_DIR}/git-completion.bash" ]]; then
    source "${PROFILE_DIR}/git-completion.bash"
fi

if [[ -f "${PROFILE_DIR}/git-prompt.sh" ]]; then
    source "${PROFILE_DIR}/git-prompt.sh"

    BLUE=$(tput setaf 6)
    NC=$(tput sgr0)

    export PS1='\u@\h \W\[${BLUE}$(__git_ps1 " (%s)")${NC}\$ '
fi
