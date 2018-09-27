# .bash_profile

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bashrc ] && . ~/.bashrc

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# keep this shell active for 4 days.
export TMOUT=345600
