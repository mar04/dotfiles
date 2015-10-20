#
# ~/.profile
#

# PATH -----------------------------------------------------------------------
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
# PATH="$HOME/.local/android-studio/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# APPS -----------------------------------------------------------------------
export BROWSER="firefox"
# export DE='xfce'
export EDITOR="vim"
export PAGER="less"
export TERMCMD="urxvtc"
export VISUAL="$EDITOR"

# CONFIG ---------------------------------------------------------------------
# export CHROMIUM_USER_FLAGS="--disk-cache-size=2000000 --ppapi-flash-path=/usr/lib/PepperFlash/libpepflashplayer.so --ppapi-flash-version=14.0.0.125"
export HISTFILE="$HOME/.local/share/bash/history"
export INPUTRC="$HOME/.config/sh/inputrc"
export LESS="-Ri"
export LESSHISTFILE="/dev/null"
export PYTHONDOCS="/usr/share/doc/python2/html/"
#export PYTHONOPTIMIZE="2"
#export PYTHONPATH=list_of_directories_containing_modules
export PYTHONSTARTUP="$HOME/.config/python_startup.py"
export QT_LOGGING_RULES="*.debug=false"
# export QT_STYLE_OVERRIDE="gtk"
# export SDL_AUDIODRIVER="alsa"
# export VDPAU_DRIVER="va_gl"
export WINEARCH="win32"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"

# SHELL ----------------------------------------------------------------------
# [[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] ; then
    startx
    exit
fi


# vim: tw=78 cc=+1
