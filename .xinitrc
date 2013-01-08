
feh --bg-fill "$HOME/pic/artwork/hardy.png"

xscreensaver -no-splash &

setxkbmap \
    -layout us,pl \
    -option grp:shifts_toggle \
    -option ctrl:nocaps \
    -option compose:lctrl \
    -option terminate:ctrl_alt_bksp

xset \
    -b \
    dpms 120 180 240 \


xrdb -merge ~/.Xresources

urxvtd -q -o -f

exec i3
