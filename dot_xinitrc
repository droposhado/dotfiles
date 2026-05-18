#!/bin/sh
#
# ~/.xinitrc
# https://wiki.debian.org/Xinitrc
# https://wiki.archlinux.org/index.php/Xinit
# https://wiki.manjaro.org/index.php?title=Proper_~/.xinitrc_File
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    #shellcheck disable=SC1090
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

setxkbmap br

xrandr --output VGA-1 --mode "1920x1080_60.00" &

eval "$(ssh-agent -s)"

# Here i3 is kept as default
session=${1:-i3}

case $session in
    i3|i3wm ) exec i3;;
    # kde               ) exec startplasma-x11;;
    # xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    * ) exec "$1";;
esac
