#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" nocompletions for \
        mv"posh*->oh-my-posh" \
        lbin"oh-my-posh" \
        atclone'
            local CONFIG="${OMP_TEMPLATE:-jandedobbeleer}";
            local OMP_TEMPLATE_URL=https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/${CONFIG}.omp.json
            ./oh-my-posh init zsh --config "$OMP_TEMPLATE_URL" > init.zsh;' \
        atpull"%atclone" \
        id-as"oh-my-posh" \
    JanDeDobbeleer/oh-my-posh