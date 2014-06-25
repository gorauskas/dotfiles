#!/usr/bin/env bash

# The strategy is to git clone the repo to ~/dotfiles and then execute this file
# to generate sym links on ~/ to all the files in the repo. This file is
# intended for use in Linux.
# Created: 2013-05-06 17:39:39 by Jonas Gorauskas [JGG]
# Modified: 2014-06-25 01:00:36

DF_DIR=${PWD}

read -p "
Is this system a server? [Y/N] " SYN

read -p "
This deployment script will symlink relevant dot files
from $DF_DIR to $HOME
Proceed? [Y/N] " YN

if [[ "$YN" == "y" || "$YN" == "Y" ]]; then
    ln -fs ${DF_DIR}/.bash_alias ${HOME}/.bash_alias
    ln -fs ${DF_DIR}/.bash_function ${HOME}/.bash_function
    ln -fs ${DF_DIR}/.bash_logout ${HOME}/.bash_logout
    ln -fs ${DF_DIR}/.bash_profile ${HOME}/.bash_profile
    ln -fs ${DF_DIR}/.bash_prompt ${HOME}/.bash_prompt
    ln -fs ${DF_DIR}/.bashrc ${HOME}/.bashrc
    ln -fs ${DF_DIR}/.gitconfig ${HOME}/.gitconfig
    ln -fs ${DF_DIR}/.inputrc ${HOME}/.inputrc
    ln -fs ${DF_DIR}/mercurial.ini ${HOME}/mercurial.ini
    ln -fs ${DF_DIR}/.tmux.conf ${HOME}/.tmux.conf
    ln -fs ${DF_DIR}/.vim ${HOME}/.vim
    ln -fs ${DF_DIR}/.vimrc ${HOME}/.vimrc

    if [[ "$SYN" == "n" || "$SYN" == "N" ]]; then
        ln -fs ${DF_DIR}/.conkyrc ${HOME}/.conkyrc
        ln -fs ${DF_DIR}/.gitk ${HOME}/.gitk
        ln -fs ${DF_DIR}/.idlerc ${HOME}/.idlerc
        ln -fs ${DF_DIR}/.Xresources ${HOME}/.Xresources

        if [ ! -d "${HOME}/bin" ]; then
            mkdir ${HOME}/bin
        fi
        cp ${DF_DIR}/urxvt-launch.sh ${HOME}/bin/urxvt-launch.sh

        if [ ! -d "${HOME}/Pictures" ]; then
            mkdir ${HOME}/Pictures
        fi
        cp -r ${DF_DIR}/tiles/ ${HOME}/Pictures/
    fi

    echo "All Done!"
elif [[ "$YN" == "n" || "$YN" == "N" ]]; then
    echo "Aborting..."
else
    echo "ERROR: Invalid choice! Aborting..."
fi
