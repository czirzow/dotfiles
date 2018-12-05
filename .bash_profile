# .bash_profile

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.bashrc ] && . ~/.bashrc

# User specific environment and startup programs

# brew's current php version
#   wish there was something better, takes forever to login
brew_php_path=$(brew --prefix php 2> /dev/null)
if [ ! -z $brew_php_path ]; then
  PATH="${brew_php_path}/bin:${PATH}"
fi

# lets add our local bin directory
PATH=$PATH:$HOME/bin

export PATH

# keep this shell active for 4 days.
export TMOUT=345600
