#
# ~/.bashrc
#
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
set -o vi
alias ls='ls --color=auto'
alias ccat='pygmentize'
alias y='yay'
PS1='[\W]\$ '
#PATH="$HOME/.local/bin:$PATH"
