# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46
# Modified: 2017-10-08 13:26:34

PATH=$PATH:/usr/sbin/
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#EOF
