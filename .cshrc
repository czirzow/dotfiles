# wont be updating this.
# mostly for reference

alias dir       'ls -laFG \!* | more -R'
alias su        '/usr/bin/su -m \!*'


bindkey -v
bindkey -k up history-search-backward
bindkey -k down history-search-forward


stty erase "^\?"
setenv CLICOLOR_FORCE 1

setenv  EDITOR  vim


setenv  COLORTERM
#setenv  COLORFGBG "cyan;black"
setenv  PARINIT "grTbiqR B=.?_A_a Q=_s>:|"

if ($?prompt) then
  # An interactive shell -- set some stuff up
  stty erase "^?"
  set prompt = "%n@%m:%~%# "

  set filec
  set history = 100
  set histdup = erase
  set savehist = 100
  set ignoreeof = 3 #Prevnt ctl-d this many times
  set mail = (/var/mail/$USER)
endif

# It is nice to have a ~/bin/ path
# for temp work.
setenv PATH $PATH:~/bin/
