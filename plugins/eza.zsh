#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" completions for \
        wait \
        atload"alias ls='eza --icons=auto';
               alias ll='eza --icons=auto -lagF';
               alias la='eza --icons=auto -lag';" \
        lbin"eza" \
        id-as"eza" \
    eza-community/eza \
        wait \
        as"completion" \
        id-as"eza-completion" \
        mv"eza-completion -> _eza" \
    "https://raw.githubusercontent.com/eza-community/eza/main/completions/zsh/_eza"