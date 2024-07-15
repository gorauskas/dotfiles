
# Bourne Again Shell init file
# Jonas Gorauskas - 2007-03-17 21:03:35
# Modified: 2017-10-29 11:11:42

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# files you make look like rw-r--r--
umask 022

if [ -s /opt/homebrew/bin/brew ]; then 
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi 

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /opt/homebrew/etc/bash_completion ]; then
    . /opt/homebrew/etc/bash_completion
fi

if [ -f "${HOME}/dotfiles/.bash_exports" ]; then
    . "${HOME}/dotfiles/.bash_exports";
fi

if [ -f "${HOME}/dotfiles/.bash_bind" ]; then
    . "${HOME}/dotfiles/.bash_bind";
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

if [ -f "${HOME}/.bash_figure" ]; then  # hidden
    . "${HOME}/.bash_figure";
fi

if [[ -f "${HOME}/dotfiles/.Xresources" && "$PLATFORM" == "Linux" ]]; then
    xrdb -merge "${HOME}/dotfiles/.Xresources";
fi

if [ -f "${HOME}/dotfiles/.bash_dev" ]; then
    . "${HOME}/dotfiles/.bash_dev";
fi
