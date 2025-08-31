#!/usr/bin/env zsh

#Dependents
plugins+=("revolver")

zinit light-mode from"gh-r" lucid wait for \
        lbin"zunit" \
        dl"https://raw.githubusercontent.com/zunit-zsh/zunit/refs/heads/master/zunit.zsh-completion -> _zunit" \
        bpick"zunit" \
    zunit-zsh/zunit 