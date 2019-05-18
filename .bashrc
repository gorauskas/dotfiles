# Bourne Again Shell init file
# Jonas Gorauskas - 2007-03-17 21:03:35
# Modified: 2017-10-29 11:11:42

# Which platform are we running on?
export PLATFORM=`uname | cut -d"-" -f1`

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTTIMEFORMAT='%F %T '

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=4096
export HISTFILESIZE=9999

# append to the history file, don't overwrite it
shopt -s histappend

# automagically `cd` when entering just a path
shopt -s autocd

# set the default editor
export EDITOR=mg
export VISUAL=mg
export TERM=xterm-256color

# python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects

if [[ "$PLATFORM" == "Linux" ]]; then
    DISTRO=$(lsb_release -si)

    if [ "${DISTRO}" == "Arch" ]; then
        # for arch linux
        export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
        [ -f /usr/bin/virtualenvwrapper_lazy.sh ] && . /usr/bin/virtualenvwrapper_lazy.sh
    fi

    if [[ "${DISTRO}" == "Debian" || "${DISTRO}" == "Ubuntu" ]]; then
        # for debian
        export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
        [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ] && . /usr/local/bin/virtualenvwrapper_lazy.sh
    fi

    # enable bash completion in interactive shells
    if [ "${DISTRO}" == "Arch" ]; then
        # for arch linux
        if [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
            . /usr/share/bash-completion/bash_completion
        fi
        if [ -f /usr/share/doc/pkgfile/command-not-found.bash ]; then
            . /usr/share/doc/pkgfile/command-not-found.bash
        fi
    fi

    if [[ "${DISTRO}" == "Debian" || "${DISTRO}" == "Ubuntu" ]]; then
        # for debian
        if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
            . /etc/bash_completion
        fi
    fi

    if [ "${DISTRO}" == "OracleServer" ]; then
        # for OEL
        if [ -f /usr/share/bash-completion/bash_completion ] && ! shopt -oq posix; then
            . /usr/share/bash-completion/bash_completion
        fi
    fi
fi

if [[ "$PLATFORM" == "FreeBSD" ]]; then
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ] && . /usr/local/bin/virtualenvwrapper_lazy.sh
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi

if [[ "$PLATFORM" == "Darwin" ]]; then
    export SHELL_SESSION_HISTORY=0

    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ] && . /usr/local/bin/virtualenvwrapper_lazy.sh
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

    export PATH="/usr/local/sbin:$PATH"
fi

if [[ "$PLATFORM" == "CYGWIN_NT" || "$PLATFORM" == "MINGW64_NT" ]]; then
    [ -f /usr/share/bash_completion/bash_completion ] && . /usr/share/bash_completion/bash_completion
fi

# don't use cowsay with ansible
export ANSIBLE_NOCOWS=1

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

# used for various experiments when writing code
if [ -d "$HOME/bin" ] ; then
    export PATH=$HOME/bin:$PATH
fi

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
