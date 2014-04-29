#
# ~/.profile
#

# PATH -----------------------------------------------------------------------
export PATH="$HOME/{.gem/ruby/2.1.0/bin,bin}:$PATH"

# APPS -----------------------------------------------------------------------
export BROWSER="firefox"
export EDITOR="vim"
export PAGER="less"
export TERMCMD="urxvtc"
export VISUAL="$EDITOR"

# CONFIG ---------------------------------------------------------------------
export HISTFILE="$HOME/.local/share/bash/history"
export INPUTRC="$HOME/.config/sh/inputrc"
export LESS="-Ri"
export LESSHISTFILE="/dev/null"
export PYTHONDOCS="/usr/share/doc/python2/html/"
#export PYTHONOPTIMIZE="2"
#export PYTHONPATH=list_of_directories_containing_modules
export PYTHONSTARTUP="$HOME/.config/python_startup.py"
export QT_STYLE_OVERRIDE="gtk"
# export SDL_AUDIODRIVER="alsa"
export WINEARCH="win32"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# SHELL ----------------------------------------------------------------------
[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && (startx)

# vim: tw=78 cc=+1
