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
alias redshift='cd tmprm && nohup redshift -l 48.799:2.505 -t 6200:3700'

alias tcd='cd /mnt/lan/gate.stalag13.ici/watch/'
alias tcdd='cd /mnt/lan/gate.stalag13.ici/download/'
alias tl='tail -n 100 /mnt/lan/gate.stalag13.ici/watch/log'
alias ts='cat /mnt/lan/gate.stalag13.ici/watch/status'
alias t='tcd && ls *.trs'
alias t+='tcd && ls *.trs+'

alias uu='cd ~/ && ~/.unison.sh'

alias pgit='git push && git push github'

alias im2gif='convert -loop 0 +dither -colors 256 -depth 8 -deconstruct $1' # [-delay 60] [-resize x350] $1 = *.jpg output.gif

APTGETTROLOLOLOLO='apt-get update && apt-get dist-upgrade && debfoster && cd /etc && git log --stat --max-count=50 --pretty=format:"%s of %aD" > /root/changelog.etc && head -n 20 /root/changelog.etc'
alias thin-apt-get='echo -e "\E[37;44m\033[1mdist-upgrade+debfoster+etckeeper => $HOSTNAME:\033[0m" && su -c "$APTGETTROLOLOLOLO"' 
alias large-apt-get='HOSTS="gate mx2 delphes"; for host in $HOSTS; do echo -e "\E[37;44m\033[1mdist-upgrade+debfoster+etckeeper => $host:\033[0m" && ssh root@$host "$APTGETTROLOLOLOLO"; done' 

function word-analysis {
    for word in `tr '[:punct:][:space:]' '\n' < $1 | sort -u`; do
	length=`echo $word | wc -m`
	if [[ "$length" -gt 4 ]]; then
	    count=`tr '[:punct:][:space:]' '\n' < $1 | grep -c $word`
	    if [[ "$count" -gt 2 ]]; then 
		echo -n "$count $word, "
	    fi
	fi
    done
    echo

    echo `wc --chars < $1`" mots"
    echo `wc --lines < $1`" lignes"
    
}


# EOF
