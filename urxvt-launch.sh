#!/usr/bin/env bash

urxvt -pixmap "`find /home/jonasg/Pictures/tiles/ -name '*.png' | sort -R | head -n 1`;style=tiled"

