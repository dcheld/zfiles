#!/usr/bin/env zsh

local sourceDir=$(dirname $0)
export EDITOR=vim

# Configs
source "$sourceDir/key-bindings.zsh"
source "$sourceDir/completion.zsh"
source "$sourceDir/aliases.zsh"
source "$sourceDir/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$sourceDir/history.zsh"
source "$sourceDir/functions.zsh"
source "$sourceDir/dotnet-core-config.zsh"
source "$sourceDir/asdf.zsh"
source "$sourceDir/fbash.zsh"

fpath=($sourceDir/completions $fpath)
autoload -Uz compinit
compinit

unset sourceDir

autoload -Uz age
autoload -Uz zargs
autoload -Uz zcalc
autoload -Uz zmv
