#!/usr/bin/env bash
# Created: 2013-05-06 17:39:39 by Jonas Gorauskas [JGG]
# Modified: 2025-03-17 13:28:22

# The strategy is to git clone the repo to ~/dotfiles and then execute this file
# to generate sym links on ~/ to all the files in the repo. This file is intended
# for use in Linux or Windows now

if [ $# -eq 0 ]; then
    echo "ERROR: No arguments!"
    exit 1
fi

DF_DIR=${PWD}

if [[ "$1" == "desktop" || "$1" == "server" ]]; then
    echo "setup general links"
    ln -v -fs ${DF_DIR}/.bash_logout ${HOME}/.bash_logout
    ln -v -fs ${DF_DIR}/.bash_profile ${HOME}/.bash_profile
    ln -v -fs ${DF_DIR}/.bashrc ${HOME}/.bashrc
    ln -v -fs ${DF_DIR}/.gitconfig ${HOME}/.gitconfig
    ln -v -fs ${DF_DIR}/.inputrc ${HOME}/.inputrc
    ln -v -fs ${DF_DIR}/mercurial.ini ${HOME}/mercurial.ini
    ln -v -fs ${DF_DIR}/.mg ${HOME}/.mg
    ln -v -fs ${DF_DIR}/.tmux.conf ${HOME}/.tmux.conf
    ln -v -fs ${DF_DIR}/.dir_colors ${HOME}/.dir_colors
    ln -v -fs ${DF_DIR}/.curlrc ${HOME}/.curlrc
    ln -v -fs ${DF_DIR}/.wgetrc ${HOME}/.wgetrc

    echo "setup alacritty"
    [ -d ~/.config/alacritty/ ] || mkdir -p ~/.config/alacritty/
    pushd ${HOME}/.config/alacritty &>/dev/null
    echo "  create links for alacritty $DF_DIR from $PWD"
    ln -v -fs ${DF_DIR}/alacritty_linux.toml alacritty.toml
    [ -L ./colors ] && rm colors
    ln -v -fs ${DF_DIR}/.alacritty-themes/colors colors
    popd &>/dev/null

    echo "setup posh"
    [ -L ~/.poshthemes ] || ln -v -fs ${DF_DIR}/.poshthemes ${HOME}/.poshthemes

    echo "setup vim"
    [ -d ./vimconf ] && rm -rf ./vimconf
    git clone https://github.com/gorauskas/vimconf.git
    ln -v -fs ${DF_DIR}/vimconf/.vimrc ${HOME}/.vimrc

    [ -h ${HOME}/.vim ] && rm ${HOME}/.vim
    ln -v -fs ${DF_DIR}/vimconf/.vim/ ${HOME}/.vim
fi

if [[ "$1" == "desktop" ]]; then
    echo "setup desktop links"
    ln -v -fs ${DF_DIR}/.gitk ${HOME}/.gitk
    ln -v -fs ${DF_DIR}/.Xresources ${HOME}/.Xresources

    if [ ! -d "${HOME}/bin" ]; then
        mkdir ${HOME}/bin
    fi
    cp ${DF_DIR}/urxvt-launch.sh ${HOME}/bin/urxvt-launch.sh

    if [ ! -d "${HOME}/Pictures" ]; then
        mkdir ${HOME}/Pictures
    fi

    [ -d ${HOME}/Pictures/tiles ] && rm -rf ${HOME}/Pictures/tiles
    cp -r ${DF_DIR}/tiles/ ${HOME}/Pictures/
elif [[ "$1" == "server" ]]; then
    echo "setup server "
    if [ ! -d "${HOME}/bin" ]; then
        mkdir ${HOME}/bin
    fi
else
    echo "ERROR: Unknown system type $1"
    exit 1
fi

exit 0
