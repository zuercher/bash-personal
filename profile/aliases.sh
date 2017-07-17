case `uname` in
    Darwin) alias ls='ls -FG';;
    Linux)  alias ls='ls --color=auto -F';;
esac

alias sum='math sum'
alias avg='math avg'
alias fuck='echo No, you fuck'


alias cgi_escape="ruby -rcgi -n -e 'puts CGI.escape(\$_)'"
alias cgi_unescape="ruby -rcgi -n -e 'puts CGI.unescape(\$_)'"
