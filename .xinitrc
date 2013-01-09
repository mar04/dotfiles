#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

feh --bg-fill "$HOME/pic/artwork/hardy.png"

setxkbmap \
    -layout us,pl \
    -option grp:shifts_toggle \
    -option ctrl:nocaps \
    -option compose:lctrl \
    -option terminate:ctrl_alt_bksp

#xset-b dpms 120 180 240
#fonts?
#emacs daemon?
xrdb -merge ~/.Xresources

xscreensaver -no-splash &

urxvtd -q -o -f

# export the current environment, in case it needs to be debugged
env > ~/.xenv

i3

# what to do next?
