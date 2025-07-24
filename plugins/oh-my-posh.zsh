#!/usr/bin/env zsh

export OH_MY_POSH_THEME="${1:-jandedobbeleer}"
zinit light-mode lucid from"gh-r" for \
        mv"posh*->oh-my-posh" \
        lbin"oh-my-posh" \
        atclone'
            ./oh-my-posh init zsh --config "$OH_MY_POSH_THEME" > init.zsh;' \
        atpull"%atclone" \
        id-as"oh-my-posh" \
    JanDeDobbeleer/oh-my-posh
