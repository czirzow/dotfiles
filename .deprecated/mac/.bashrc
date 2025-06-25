# Source global definitions
fi

# User specific aliases and functions
export EDITOR=vim

set -o vi
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# show who I have set as the leader of my docker swarm.
ps1_docker_leader() {
  [ ! -z "$DOCKER_MACHINE_NAME" ] &&  echo "($DOCKER_MACHINE_NAME)"
}
# show current branch name
ps1_git_branch() {
  # only run 'git branch' if inside of $HOME/git/* path.
  [[ $PWD == "${HOME}/git/"* ]] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
  #[ -d .git ] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
PS1="\u@\h:\[\033[32m\]\w\[\033[33m\]\$(ps1_git_branch)\e[38;5;122m\$(ps1_docker_leader)\[\033[00m\]$ "

# I've always liked the MSDOS dir command.
dir () {
  CLICOLOR_FORCE=1 ls -laFGw "$@" | less -XR
}
alias ackless='ack --group --color \!* | less -XR'

export PAGER="less -XR"

SOCK=$HOME/.ssh/agent
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
        rm -f $HOME/.ssh/agent
        ln -sf $SSH_AUTH_SOCK $HOME/.ssh/agent
        export SSH_AUTH_SOCK=$SOCK
fi
