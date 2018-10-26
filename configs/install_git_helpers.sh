#!/bin/bash

DIR=$(cd `dirname $0`/.. && pwd)
PROFILE="${DIR}/profile"

function get {
    URL="$1"
    FILE="$2"

    echo "Downloading ${URL}"
    echo "        to  ${PROFILE}/${FILE}"
    curl -s --output "${PROFILE}/${FILE}" "${URL}"
}

get https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    git-completion.bash
     
get https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    git-prompt.sh
