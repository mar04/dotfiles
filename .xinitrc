#!/bin/bash
#
# ~/.xinitrc
#

# GLOBAL SETTINGS
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# WALLPAPER
#BCKG="~/pic/artwork/arch_grey.png"
#feh --no-fehbg --bg-fill $BCKG

# KEYBOARD MAP
# find available options in /usr/share/X11/xkb/rules/base.lst
setxkbmap \
    -layout pl \
    -option shift:both_capslock \
    -option ctrl:nocaps \
    -option terminate:ctrl_alt_bksp \
	#-option grp:shifts_toggle \
	#-option compose:lctrl \
	#-layout us,pl \

# KEYBOARD SHORTCUTS
sxhkd &

# DPMS
xset -dpms
xset s off

# BELL
xset -b

# URXVT
xrdb -merge ~/.config/Xresources/Xresources
urxvtd -q -o -f

# MUSIC
#[ ! -s ~/.config/mpd/mpd.pid ] && mpd ~/.config/mpd/mpd.conf
#urxvtc -e ncmpcpp --config ~/.config/ncmpcpp/config &

# GMAIL
killall gnome-keyring-daemon
gnome-gmail-notifier &

# RSS
#liferea &

# COMPTON
compton --vsync opengl &

# WINDOW MANAGER
exec i3

