#!/bin/bash
#
# ~/.xinitrc
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi


# WALLPAPER
BCKG="$HOME/pic/artwork/arch_grey.png"
feh --no-fehbg --bg-fill $BCKG


# KEYBOARD
setxkbmap \
	-layout us,pl \
	-option grp:shifts_toggle \
	-option ctrl:nocaps \
	#-option compose:lctrl \
	-option terminate:ctrl_alt_bksp


# KEYBOARD SHORTCUTS
xbindkeys


# DISABLE TURNING OFF SCREEN
xset dpms force on
xset s off


# DISABLE BELL
xset -b


# URXVT
xrdb -merge ~/.Xresources
urxvtd -q -o -f


# MPD
[ ! -s ~/.config/mpd/mpd.pid ] && mpd ~/.config/mpd/mpd.conf


# GMAIL
killall gnome-keyring-daemon
gnome-gmail-notifier &


# I3
exec i3

