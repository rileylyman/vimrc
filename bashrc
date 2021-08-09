#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

screenfetch

function _update_ps1() {
    PS1="$(powerline $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Path for gcc-arm
export PATH=$PATH:/opt/gcc-arm/bin

alias tmux="TERM=screen-256color-bce tmux"

alias ls='exa -a --group-directories-first -lhUma --git'
set -o vi

export GOPATH=/home/riley/go
export PATH=$PATH:/home/riley/go/bin

alias stmscreen='screen /dev/ttyACM0 115200'
alias vim='nvim'

. "$HOME/.cargo/env"
