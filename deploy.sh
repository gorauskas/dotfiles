#!/usr/bin/env bash

# The strategy is to git clone the repo to ~/dotfiles and then execute this file
# to generate sym links on ~/ to all the files in the repo. This file is
# intended for use in Linux.
# Created: 2013-05-06 17:39:39 by Jonas Gorauskas [JGG]
# Modified: 2014-09-07 03:08:39

DF_DIR=${PWD}

read -p "
Is this system a server? [Y/N] " SYN

read -p "
This deployment script will symlink relevant dot files
from $DF_DIR to $HOME
Proceed? [Y/N] " YN

if [[ "$YN" == "y" || "$YN" == "Y" ]]; then
    ln -v -fs ${DF_DIR}/.bash_alias ${HOME}/.bash_alias
    ln -v -fs ${DF_DIR}/.bash_function ${HOME}/.bash_function
    ln -v -fs ${DF_DIR}/.bash_logout ${HOME}/.bash_logout
    ln -v -fs ${DF_DIR}/.bash_profile ${HOME}/.bash_profile
    ln -v -fs ${DF_DIR}/.bash_prompt ${HOME}/.bash_prompt
    ln -v -fs ${DF_DIR}/.bashrc ${HOME}/.bashrc
    ln -v -fs ${DF_DIR}/.gitconfig ${HOME}/.gitconfig
    ln -v -fs ${DF_DIR}/.inputrc ${HOME}/.inputrc
    ln -v -fs ${DF_DIR}/mercurial.ini ${HOME}/mercurial.ini
    ln -v -fs ${DF_DIR}/.tmux.conf ${HOME}/.tmux.conf
    ln -v -fs ${DF_DIR}/.vimrc ${HOME}/.vimrc

    [ -h ${HOME}/.vim ] && rm ${HOME}/.vim
    ln -v -fs ${DF_DIR}/.vim/ ${HOME}/.vim

    if [[ "$SYN" == "n" || "$SYN" == "N" ]]; then
        ln -v -fs ${DF_DIR}/.conkyrc ${HOME}/.conkyrc
        ln -v -fs ${DF_DIR}/.gitk ${HOME}/.gitk
        ln -v -fs ${DF_DIR}/.Xresources ${HOME}/.Xresources

        [ -h ${HOME}/.idlerc ] && rm ${HOME}/.idlerc
        ln -v -fs ${DF_DIR}/.idlerc/ ${HOME}/.idlerc

        if [ ! -d "${HOME}/bin" ]; then
            mkdir ${HOME}/bin
        fi
        cp ${DF_DIR}/urxvt-launch.sh ${HOME}/bin/urxvt-launch.sh

        if [ ! -d "${HOME}/Pictures" ]; then
            mkdir ${HOME}/Pictures
        fi
        cp -r ${DF_DIR}/tiles/ ${HOME}/Pictures/

        printf "%s\n" "" "if [ \"\$\(lsb_release -si\)\" == \"Arch\" ]; then" "    linux_logo -b -f -u -L 1" "else" "    linux_logo -b -f -u -L banner-simp" "fi" "" >> ./.bashrc;

        printf "\nprompt fancy\n\n#OEF\n" >> ./.bashrc;
    else
        printf "\nprompt def\n\n#EOF\n" >> ./.bashrc
    fi

    echo "All Done!"
elif [[ "$YN" == "n" || "$YN" == "N" ]]; then
    echo "Aborting..."
else
    echo "ERROR: Invalid choice! Aborting..."
fi
