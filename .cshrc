#	$Id: dot.cshrc,v 1.9 1998/09/02 14:10:22 bde Exp $
#
# .cshrc - csh resource script, read at beginning 
#	   of execution by each shell
#
# see also csh(1), environ(7).
#


alias h         history 25
alias j         jobs -l
alias la        ls -a
alias lf        ls -FA
alias ll        ls -lA
alias dir       'ls -laF --color=always \!* | less -XR'
alias su        '/bin/su -m \!*'
alias ackless   'ack --group --color \!* | less -XR'

set path=($path /usr/local/mysql/bin /home/curt/bin)


bindkey -v
bindkey -k up history-search-backward
bindkey -k down history-search-forward


setenv	EDITOR	vi

setenv	PAGER	'less -R'
setenv	BLOCKSIZE	K
setenv  CVS_RSH ssh


setenv  COLORTERM
#setenv  COLORFGBG "cyan;black"
setenv  PARINIT "grTbiqR B=.?_A_a Q=_s>:|" 

if ($?prompt) then
	# An interactive shell -- set some stuff up
	stty erase "^?"

	set location="`echo $HOSTNAME | cut -d. -f2`"
	if($?SSH_AGENT_PID) then
		set prompt = "ssh.%n@%m${location}:%~%# "
	else 
		set prompt = "%n@%m.${location}:%~%# "
	endif
	

	set filec
	set history = 100
	set histdup = erase
	set savehist = 100
	set ignoreeof = 3 #Prevnt ctl-d this many times
	#set mail = (/var/mail/$USER)
	screen -ls
	tmux ls
endif
