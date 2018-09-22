# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export EDITOR=vim

set -o vi
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# dont need this for SS, should be set per box
# PS1="\u@\h.ma01:\w\$ "

alias dir='ls -laF --color=auto'
alias ackless='ack --group --color \!* | less -XR'

export PAGER="less -XR"

SOCK=$HOME/.ssh/agent
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
        rm -f $HOME/.ssh/agent
        ln -sf $SSH_AUTH_SOCK $HOME/.ssh/agent
        export SSH_AUTH_SOCK=$SOCK
fi
