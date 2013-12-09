# Bourne Again Shell - Exec by the command interpreter for login shells.  This
# file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# Jonas Gorauskas - 2007.03.17 22:00:00
# Modified: 2013-12-09 01:06 by jgg

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
