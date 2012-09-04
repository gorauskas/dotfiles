# Bourne Again Shell Profile
# Jonas Gorauskas - 2007-03-17 22:38:46
# Modified: 2012-09-04 01:08 by jgg

PATH=$PATH:/usr/sbin/
BASH_ENV=$HOME/.bashrc
PS1='[\t \h:\W]\\$ '
PS2='> '
EDITOR=emacs

export BASH_ENV PATH PS1 PS2 EDITOR
unset USERNAME

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#EOF
