#!/usr/bin/env bash

# The strategy is to git clone the repo to ~/dotfiles and then execute this file
# to generate sym links on ~/ to all the files in the repo. This file is
# intended for use in Linux.
# Created: 2013-05-06 17:39:39 by Jonas Gorauskas [JGG]
# Modified: 2013-12-09 01:45 by jgg

DF_DIR=${PWD}
DOTFILES=$(ls -A -I .git -I _* -I RE* -I key* -I *.sh ${DF_DIR})

read -p "
This deployment script will symlink relevant dot files
from $DF_DIR to $HOME
Proceed? [Y/n] " YN

for df in ${DOTFILES}; {
    bf=$(basename ${df});
    ln -Ffs ${DF_DIR}/${bf} ${HOME}/${bf};
}

echo "All Done!"
