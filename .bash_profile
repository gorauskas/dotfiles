# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46
# Modified: 2014-11-02 11:44:36

PATH=$PATH:/usr/sbin/
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#EOF
