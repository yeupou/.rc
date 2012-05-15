# -*- sh -*-
# interactive login shell, or with --login, source:
# 
# /etc/profile ...
#   ~/.bash_profile ... 
#     ~/.bash_login ...
#       ~/.profile

# nothing specific for login. So directly source the config 
# for non-login shell:
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# EOF
