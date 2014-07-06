# Bourne Again Shell init file
# Jonas Gorauskas - 2007-03-17 21:03:35
# Modified: 2014-07-05 23:01:35

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTTIMEFORMAT='%F %T '

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=4096
export HISTFILESIZE=9999

# append to the history file, don't overwrite it
shopt -s histappend

# set the default editor
export EDITOR=zile
export VISUAL=emacsclient
export TERM=xterm-256color

# python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper_lazy.sh ] && . /usr/local/bin/virtualenvwrapper_lazy.sh

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case $TERM in
    xterm*|rxvt*)
        TITLEBAR='\[\033]0;\u@\h:\W\007\]' ;;
    *)
        TITLEBAR="" ;;
esac
export TITLEBAR

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# used for various experiments when writing code
if [ -d "$HOME/bin" ] ; then
    PATH=$HOME/bin:$PATH
fi
export PATH

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

if [ "$(lsb_release -si)" == "Arch" ]; then
    linux_logo -b -f -u -L 1
else
    linux_logo -b -f -u -L banner-simp
fi
