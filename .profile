#!/bin/sh

# PATH -----------------------------------------------------------------------
export GOPATH="$HOME/code/go"
# PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$HOME/.local/android-studio/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# APPS -----------------------------------------------------------------------
export BROWSER="firefox"
# export DE='xfce'
export EDITOR="nvim"
export PAGER="less"
# export TERMCMD="urxvtc"
export VISUAL="$EDITOR"

_RUST="$HOME/.multirust/toolchains/stable-x86_64-unknown-linux-gnu"
# CONFIG ---------------------------------------------------------------------
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
# export CHROMIUM_USER_FLAGS="--disk-cache-size=2000000 --ppapi-flash-path=/usr/lib/PepperFlash/libpepflashplayer.so --ppapi-flash-version=14.0.0.125"
export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_DEFAULT_OPTS="--exact"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE="$HOME/.local/share/bash/history"
# export HISTTIMEFORMAT="%x - %X: "
export INPUTRC="$HOME/.config/sh/inputrc"
export LESS="-FXRi"
export LESSHISTFILE="/dev/null"
export MANPATH="$(manpath):$_RUST/share/man:$HOME/.local/share/man"
# export MOZ_USE_XINPUT2=1
export PYTHONDOCS="/usr/share/doc/python2/html/"
#export PYTHONOPTIMIZE="2"
export PYTHONSTARTUP="$HOME/.config/python_startup.py"
# export QT_LOGGING_RULES="*=false"
# export QT_STYLE_OVERRIDE="gtk"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export RUST_SRC_PATH="$_RUST/lib/rustlib/src/rust/src"
export SAL_USE_VCLPLUGIN="gtk3"
# export SDL_AUDIODRIVER="alsa"
# export VDPAU_DRIVER="va_gl"
# export WINEARCH="win32"
export WINEDEBUG="-all"

# SHELL ----------------------------------------------------------------------
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] ; then
    startx
    exit
fi


# vim: tw=78 cc=+1
