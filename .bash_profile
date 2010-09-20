# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46

PATH=$PATH:/usr/sbin/:$HOME/bin
BASH_ENV=$HOME/.bashrc
PS1='[\t \h:\W]\\$ '
PS2='> '

export BASH_ENV PATH PS1 PS2 
unset USERNAME

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#EOF
