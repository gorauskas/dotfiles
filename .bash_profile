# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46
# Modified: 2013-12-09 01:43 by jgg

PATH=$PATH:/usr/sbin/
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH
unset USERNAME

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#EOF
