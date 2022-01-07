
# Bourne Again Shell init file
# Jonas Gorauskas - 2007-03-17 21:03:35
# Modified: 2017-10-29 11:11:42

if [ -f ~/.bash_exports ]; then
    . ~/.bash_exports
fi

# append to the history file, don't overwrite it
shopt -s histappend

# automagically `cd` when entering just a path
shopt -s autocd

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# files you make look like rw-r--r--
umask 022

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_function ]; then
    . ~/.bash_function
fi

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_figure ]; then  # hidden
    . ~/.bash_figure
fi

if [ -f ~/.bash_dev ]; then
    . ~/.bash_dev
fi
