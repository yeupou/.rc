# interactive non-login shell
# Copyleft http://yeupou.wordpress.com

# make sure site-wide conf was sourced
. /etc/profile
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
elif [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# shell behavior
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin"
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=20000

# general vars
export USER=`whoami`
export EDITOR="emacs"
export CVS_RSH="ssh"

# useful/less aliases
alias redshift='redshift -l 48.799:2.505 -t 6200:3700'

alias tcd='cd /mnt/lan/gate.stalag13.ici/watch/'
alias tl='tail -n 100 /mnt/lan/gate.stalag13.ici/watch/log'
alias ts='cat /mnt/lan/gate.stalag13.ici/watch/status'
alias t='ls /mnt/lan/gate.stalag13.ici/watch/*.hash'
alias t+='ls /mnt/lan/gate.stalag13.ici/watch/*+'

alias uu='~/.unison.sh'

alias pgit='git push && git push github'

alias im2gif='convert -loop 0 +dither -colors 256 -depth 8 -deconstruct $1' # [-delay 60] [-resize x350] $1 = *.jpg output.gif


# EOF
