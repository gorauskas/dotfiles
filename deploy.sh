#!/usr/bin/env bash
# Created: 2013-05-06 17:39:39 by Jonas Gorauskas [JGG]
# Modified: 2022-11-19 13:28:22

# The strategy is to git clone the repo to ~/dotfiles and then execute this file
# to generate sym links on ~/ to all the files in the repo. This file is intended
# for use in Linux or Windows now

export PLATFORM=`uname | cut -d"-" -f1`

if [[ "$PLATFORM" == "CYGWIN_NT" || "$PLATFORM" == "MINGW64_NT" ]]; then

    echo "setup on windows"
    cp ./.bash_exports ${HOME}/.bash_exports
    cp ./.bash_bind ${HOME}/.bash_bind
    cp ./.bash_alias ${HOME}/.bash_alias
    cp ./.bash_function ${HOME}/.bash_function
    cp ./.bash_logout ${HOME}/.bash_logout
    cp ./.bash_profile ${HOME}/.bash_profile
    cp ./.bash_prompt ${HOME}/.bash_prompt
    cp ./.bash_dev ${HOME}/.bash_dev
    cp ./.bashrc ${HOME}/.bashrc
    cp ./.gitconfig ${HOME}/.gitconfig
    cp ./mercurial.ini ${HOME}/mercurial.ini
    cp ./.mg ${HOME}/.mg
    cp ./.tmux.conf ${HOME}/.tmux.conf
    cp ./.minttyrc ${HOME}/.minttyrc
    cp ./.dir_colors ${HOME}/.dir_colors

else

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
        ln -v -fs ${DF_DIR}/mercurial.ini ${HOME}/mercurial.ini
        ln -v -fs ${DF_DIR}/.mg ${HOME}/.mg
        ln -v -fs ${DF_DIR}/.tmux.conf ${HOME}/.tmux.conf
        ln -v -fs ${DF_DIR}/.dir_colors ${HOME}/.dir_colors

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

fi

exit 0
