#
# ~/.profile
#

# PATH -----------------------------------------------------------------------
export PATH="$HOME/bin:$PATH"

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
#export PYTHONOPTIMIZE="2"
#export PYTHONPATH=list_of_directories_containing_modules
export PYTHONSTARTUP="$HOME/.config/python_startup.py"
export SDL_AUDIODRIVER="alsa"
export WINEARCH="win32"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

# SHELL ----------------------------------------------------------------------
[[ -f ~/.bashrc ]] && . ~/.bashrc

# vim: tw=78 cc=+1
