#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[0;35m\][\A]\[\e[0m\] \h:\[\e[1;33m\]\w\[\e[0m\] \[\e[1;32m\]|\[\e[0m\] '
