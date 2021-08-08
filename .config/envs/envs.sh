#!/usr/bin/env bash

# proxy
# export http_proxy="http://127.0.0.1:8118"
# export https_proxy="http://127.0.0.1:8118"

# tools
export EDITOR="nvim"
export TERM="xterm-256color"

# PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/ide/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
