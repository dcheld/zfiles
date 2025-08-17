#!/usr/bin/env zsh

export OH_MY_POSH_THEME="${1:-jandedobbeleer}"
zinit light-mode lucid from"gh-r" for \
        mv"posh*->oh-my-posh" \
        lbin"oh-my-posh" \
        atclone'mkdir -p themes' \
        atpull"%atclone" \
        atinit"
            if [[ ! -f themes/${OH_MY_POSH_THEME} ]]; then
                rm -rf themes/* > /dev/null 2>&1;
                oh-my-posh init zsh --config ${OH_MY_POSH_THEME} > init.zsh \
                    && touch themes/${OH_MY_POSH_THEME};
            fi" \
        id-as"oh-my-posh" \
    JanDeDobbeleer/oh-my-posh
