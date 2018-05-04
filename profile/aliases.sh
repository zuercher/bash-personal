if $IS_MACOS; then
    alias ls='ls -FG'
else
    alias ls='ls --color=auto -F'
fi

alias sum='math sum'
alias avg='math avg'
alias fuck='echo No, you fuck'

alias cgi_escape="ruby -rcgi -n -e 'puts CGI.escape(\$_)'"
alias cgi_unescape="ruby -rcgi -n -e 'puts CGI.unescape(\$_)'"

alias docker-clean="docker ps -a -q | xargs docker rm && docker images | grep '^<none>' | awk '{print \$3}' | xargs docker rmi"
