# -*- sh -*-

case `hostname` in 
    otto|ulysse)
	export BROWSER=mozilla-firefox GNUSTEP_USER_ROOT=~/.GNUstep
	xset b 5 100 & # silent bell
	xset m 3 35 & # mouse speed
	xscreensaver -no-splash &
	wmaker
	;;
    nibbler)
	export BROWSER=midori
	startxfce4
	;;
    *)
	
	export BROWSER=konqueror
	xhost +
	eval "$(gpg-agent --daemon)"
	if [ -x /usr/bin/redshift ]; then 
	    redshift -l 48.799:2.505 -t 6200:3700 &  
	fi
	startkde
	;;
esac

# EOF
