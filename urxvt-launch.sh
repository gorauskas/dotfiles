#!/usr/bin/env bash

urxvt -pixmap "`find $HOME/Pictures/tiles/ -name '*.png' | sort -R | head -n 1`;style=tiled"
