
# Bourne Again Shell init file
# Jonas Gorauskas - 2007-03-17 21:03:35
# Modified: 2017-10-29 11:11:42

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f "${HOME}/dotfiles/.bash_exports" ]; then
    . "${HOME}/dotfiles/.bash_exports";
fi

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# automagically `cd` when entering just a path
shopt -s autocd

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# files you make look like rw-r--r--
umask 022

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f "${HOME}/dotfiles/.bash_function" ]; then
    . "${HOME}/dotfiles/.bash_function";
fi

if [ -f "${HOME}/dotfiles/.bash_alias" ]; then
    . "${HOME}/dotfiles/.bash_alias";
fi

if [ -f "${HOME}/dotfiles/.bash_prompt" ]; then
    . "${HOME}/dotfiles/.bash_prompt";
fi

if [ -f "${HOME}/dotfiles/.bash_figure" ]; then  # hidden
    . "${HOME}/dotfiles/.bash_figure";
fi

if [ -f "${HOME}/dotfiles/.bash_dev" ]; then
    . "${HOME}/dotfiles/.bash_dev";
fi
