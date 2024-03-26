#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim="nvim"

PS1='[\u@\h \W]\$ '

# Created by `pipx` on 2024-03-22 19:36:28
export PATH="$PATH:/home/carl/.local/bin"

if [ "$(tty)" = "/dev/tty1" ] ; then
    export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_WEBRENDER=1
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi

eval "$(starship init bash)"

# Testing
