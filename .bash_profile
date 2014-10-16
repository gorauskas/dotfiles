# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46
# Modified: 2014-10-16 14:50:51

PATH=$PATH:/usr/sbin/
BASH_ENV=$HOME/.bashrc

export BASH_ENV PATH

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent -s`
    mysshadd `head -1 sshkeypwd`
fi

#EOF
