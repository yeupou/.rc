# -*- sh -*-
# Copyleft http://yeupou.wordpress.com
# interactive non-login shell source:
#
# /etc/bash.bashrc ...
#   ~/.bashrc

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
alias uu='cd ~/ && ~/.unison.sh'
alias urc='cd ~/.rc && git pull'
alias pgit='git push && git push github'

alias fix_kded='qdbus org.kde.kded /modules/networkstatus setNetworkStatus ntrack 4'

alias im2gifslow='convert -loop 0 +dither -colors 256 -depth 8 -delay 60 -layers optimize -deconstruct $1' #  -resize 38000@ -layers optimize [-delay 60] [-resize x350] $1 = *.jpg output.gif 
alias im2gif='convert -loop 0 +dither -colors 256 -depth 8 -delay 15 -layers optimize -deconstruct $1' #  -resize 38000@ -layers optimize [-delay 60] [-resize x350] $1 = *.jpg output.gif 

APTGETTROLOLOLOLO='export TERM='$TERM' && apt-get update && apt-get dist-upgrade && debfoster && cd /etc && git log --stat --max-count=50 --pretty=format:"%s of %aD" > /root/changelog.etc && head -n 20 /root/changelog.etc'
alias thin-apt-get='echo -e "\E[37;44m\033[1mdist-upgrade+debfoster+etckeeper => $HOSTNAME:\033[0m" && su -c "$APTGETTROLOLOLOLO"' 
alias large-apt-get='HOSTS="gate mx2 delphes"; for host in $HOSTS; do echo -e "\E[37;44m\033[1mdist-upgrade+debfoster+etckeeper => $host:\033[0m" && ssh root@$host "$APTGETTROLOLOLOLO"; done' 

alias pw='cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 15 | head -n 1'
   
function word-analysis {
    echo "== Contenu de $1 =="
    dict=/usr/share/dict/words
    gcount=0 # frequent words count

    # go through the words list
    for word in `tr '[:punct:][:space:]' '\n' < $1 | sort -u`; do
	# count chars and take into account only if 4 at least
	# (wc -m = n+1)
	if [[ `echo $word | wc -m` -lt 5 ]]; then
	    continue
	fi
	
	# count occurences, take into account only if 3 at least
	count=`tr '[:punct:][:space:]' '\n' < $1 | grep -c ^$word$`
	if [[ "$count" -lt 3 ]]; then 
	    continue
	fi

	# check if the word in in the dictionary (cpu consuming, so last
	# test being made)
	if [[ `grep -c ^$word$ $dict` -lt 1 ]]; then
	    continue		
	fi
	
	# register only if we reach here 
	echo -n "$count $word, "
	gcount=`expr $gcount \+ 1`
    done
    echo

    echo `wc --chars < $1`" charactères"
    echo `wc --words < $1`" mots, dont $gcount souvent répétés"
    echo `wc --lines < $1`" lignes"
    
}

# EOF
