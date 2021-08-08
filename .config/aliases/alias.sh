#!/usr/bin/env bash

# pacman
alias search="brew search"
alias install="brew install"

# paths
alias ..='cd ..'
alias 2..='cd ../../'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias 6..='cd ../../../../../..'

# tools
alias c='clear'
alias d='sudo docker'
alias e='nvim'
alias f='fzf'
alias r='ranger'
alias t='tmux new -n github -s workspace'
alias vim='nvim'

# git
alias pull='git pull'
alias merge='git merge'
alias gco='git checkout'
alias fetch='git fetch'

# misc
alias cp='cp -v'
alias rm='rm -v'
alias ls='ls -G'

alias proxy='export http_proxy=http://127.0.0.1:8118 \
             && export https_proxy=http://127.0.0.1:8118 \
             && export ALL_PROXY=socks5://127.0.0.1:9997'

alias unproxy='unset http_proxy \
               && unset https_proxy \
               && unset ALL_PROXY'
