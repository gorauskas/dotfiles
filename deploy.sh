#!/bin/bash
# Quick script to deploy dot files to the correct location
# Created: 2013-05-06 17:39:39 by Jonas Gorauskas [JGG]
# Modified: 2013-12-04 22:26 by jgg

SOURCE="${BASH_SOURCE[0]}"

# resolve $SOURCE until the file is no longer a symlink
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"

  # if $SOURCE was a relative symlink, we need to resolve it
  # relative to the path where the symlink file was located
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

read -p "
This deployment script will copy relevant dot files
from $DIR to $HOME
Proceed? [Y/n] " YN

while true; do
    case $YN in
        [Yy]*) break;;
        [Nn]*) echo "Aborting..."; exit;;
        *) read -p "Please answer Y or N!!! " YN ;;
    esac
done

if [ -d $DIR ]; then
    for SHFILE in `ls -1 $DIR/.bash* $DIR/.in* $DIR/.pro* $DIR/.vimrc $DIR/.[xX]*`; do
        echo "Copying $SHFILE to $HOME/ ..."
        cp $SHFILE $HOME
    done
fi

echo "Copying $DIR/.vim to $HOME/ ..."
cp -r $DIR/.vim $HOME

echo "Copying $DIR/.gitconfig to $HOME/ ..."
cp $DIR/.gitconfig $HOME

echo "Copying $DIR/.gitk to $HOME/ ..."
cp $DIR/.gitk $HOME

echo "Copying $DIR/.conkyrc to $HOME/ ..."
cp $DIR/.conkyrc $HOME

echo "Copying $DIR/mercurial.ini to $HOME/ ..."
cp $DIR/mercurial.ini $HOME

echo "All done!"
