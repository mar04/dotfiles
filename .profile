#
# ~/.profile
#

PATH=$PATH:/home/mariusz/bin
PATH=$PATH:/home/mariusz/.local/maple13_installation/bin
export PATH


export CHROMIUM_USER_FLAGS="--disk-cache-dir=/dev/null"
export EDITOR=vim
export PAGER=less
export PYTHONOPTIMIZE=2
export SDL_AUDIODRIVER="alsa"
export TERMCMD=urxvtc
export VDPAU_DRIVER=va_gl
export VISUAL=$EDITOR
export WINEARCH=win32
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"


[[ -f ~/.bashrc ]] && . ~/.bashrc


