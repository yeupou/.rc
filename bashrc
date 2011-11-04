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
alias redshift='redshift -l 48.799:2.505 -t 6500:9300'
alias redoff='redshift -o -t 6500:6500'
alias redon='redshift -o -t 6500:9300'

alias tcd='cd /stockage/torrent/watch/'
alias tl='tail -n 100 /stockage/torrent/watch/log'
alias ts='cat /stockage/torrent/watch/status'
alias t='ls /stockage/torrent/watch/*.hash'
alias t+='ls /stockage/torrent/watch/*+'

# EOF
