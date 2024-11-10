#!/usr/bin/env zsh

export OH_MY_POSH_THEME="${1:-jandedobbeleer}"
zinit light-mode lucid from"gh-r" for \
        mv"posh*->oh-my-posh" \
        lbin"oh-my-posh" \
        atclone'
            local OMP_TEMPLATE_URL="https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/${OH_MY_POSH_THEME}.omp.json"
            ./oh-my-posh completion zsh > _oh-my-posh;
            ./oh-my-posh init zsh --config "$OMP_TEMPLATE_URL" > init.zsh;' \
        atpull"%atclone" \
        id-as"oh-my-posh" \
    JanDeDobbeleer/oh-my-posh