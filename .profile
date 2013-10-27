#
# ~/.profile
#

PATH=$HOME/bin:$PATH
#PATH=$HOME/.local/maple13_installation/bin:$PATH
export PATH


export BROWSER="firefox"
#export CHROMIUM_USER_FLAGS="--disk-cache-dir=/dev/null"
export CMUS_HOME="$HOME/.config/cmus"
export EDITOR="vim"
export HISTFILE="$HOME/.cache/sh/history"
export INPUTRC="$HOME/.config/sh/inputrc"
export LESSHISTFILE="/dev/null"
export PAGER="less"
#export PYTHONOPTIMIZE="2"
#export PYTHONPATH=list_of_directories_containing_modules
export PYTHONSTARTUP="$HOME/.config/python_startup.py"
export SDL_AUDIODRIVER="alsa"
export TERMCMD="urxvtc"
#export VDPAU_DRIVER="va_gl"
export VISUAL=$EDITOR
export WINEARCH="win32"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"


[[ -f ~/.bashrc ]] && . ~/.bashrc

