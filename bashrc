#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u] \W]\$ '
screenfetch

# Path for gcc-arm
export PATH=$PATH:/opt/gcc-arm/bin

alias tmux="TERM=screen-256color-bce tmux"

alias ls="ls -la"
set -o vi

export GOPATH=/home/riley/go
export PATH=$PATH:/home/riley/go/bin

alias stmscreen='screen /dev/ttyACM0 115200'
alias vim='nvim'

. "$HOME/.cargo/env"
