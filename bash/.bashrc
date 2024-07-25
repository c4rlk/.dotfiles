#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim="nvim"
alias ssh='TERM=xterm-256color ssh'

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

man ()
{
    export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # Cyan
    export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 5) # Magenta
    export GROFF_NO_SGR=1

    command man "$@"
}


GPG_TTY=$(tty)
export GPG_TTY
