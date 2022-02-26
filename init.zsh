#!/usr/bin/env zsh

sourceDir=$(dirname $0)
export EDITOR=vim

# Configs
source "$sourceDir/key-bindings.zsh"
source "$sourceDir/completion.zsh"
source "$sourceDir/aliases.zsh"
source "$sourceDir/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$sourceDir/history.zsh"
source "$sourceDir/functions.zsh"
source /opt/asdf-vm/asdf.sh

autoload -Uz age
autoload -Uz zargs
autoload -Uz zcalc
autoload -Uz zmv
