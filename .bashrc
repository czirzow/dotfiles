# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
export EDITOR=nvim
IGNOREEOF=42

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
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
PS1="@\h:\[\033[32m\]\w\[\033[0m\]\\$ "
PS1="@\h:\[\e[32m\]\w\[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
#PS1="\u@\h:\[\033[32m\]\w\[\033[33m\]\$(ps1_git_branch)\e[38;5;122m\$(ps1_docker_leader)\[\033[0m\]$ "

PROMPT_COMMAND='echo -en "\033]0;@$(hostname)|$(pwd|cut -d "/" -f 4-100)\a"'

# I've always liked the MSDOS dir command.
dir () {
  CLICOLOR_FORCE=1 ls -laFG --color=always "$@" | less -XR
}
alias ackless='ack --group --color \!* | less -XR'
alias vi='nvim'

export PAGER="less -XR"

SOCK=$HOME/.ssh/agent
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
        rm -f $HOME/.ssh/agent
        ln -sf $SSH_AUTH_SOCK $HOME/.ssh/agent
        export SSH_AUTH_SOCK=$SOCK
fi
