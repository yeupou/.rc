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

function scan2pdf {
    cd ~/tmprm/scan
    FILE=$1
    [ "$FILE" == "" ] && read FILE
    [ -e "$FILE".pdf ] && return
    # A4 gray
    scanimage -l 0 -t 0 -x 215 -y 297 --mode Gray --resolution=300 > "$FILE".pnm
    pnmtops -dpi 300 "$FILE".pnm > "$FILE".ps
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -sOutputFile="$FILE".pdf "$FILE".ps
    rm -f "$FILE".pnm "$FILE".ps
}

function scan2pdfs {
    cd ~/tmprm/scan
    ENDFILE=$1
    LIST=""
    [ "$ENDFILE" == "" ] && read ENDFILE
    for i in `seq --equal-width 999`; do
	echo "(d)one?"
	read NEXT
	[ "$NEXT" == "d" ] && break
	scan2pdf "$ENDFILE"$i
	LIST="$LIST $ENDFILE"$i".pdf"
    done
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sOutputFile="$ENDFILE".pdf -f "$ENDFILE"*.pdf
    echo "OK? (CTRL-C)"
    read OK    
    rm -f $LIST
}

    
function latex2ps {
    # http://cvs.gna.org/cvsweb/darius-tools/text/sh/latex2ps.sh?rev=1.6;content-type=text%2Fplain;cvsroot=darius-tools
    FILE=${1%.tex}
    [ ! -e "$FILE".tex ] && return
    
    # we latex-compile 2 times so we get nice \tableofcontents
    echo "--- Running LaTeX..."
    latex \\nonstopmode\\input "$FILE".tex >/dev/null
    echo "--- Running LaTeX one more time, for indexes etc..."
    latex \\nonstopmode\\input "$FILE".tex >/dev/null
    # the dvi ouput must be in the current directory, it is how latex works
    # by default
    NEWFILE=`basename $FILE`
    echo "--- Generating postscript..."
    dvips -o "$NEWFILE".ps "$NEWFILE".dvi >/dev/null
    rm -f "$NEWFILE".aux "$NEWFILE".log "$NEWFILE"*~ "$NEWFILE".dvi "$NEWFILE".toc
    echo "--- Generating pdf..."
    ps2pdf "$FILE".ps >/dev/null
    rm -f "$FILE".ps
}

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
