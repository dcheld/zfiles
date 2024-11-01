#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" completions for \
        wait \
        atload"alias ls='eza --icons=auto';
               alias ll='eza --icons=auto -lagF';
               alias la='eza --icons=auto -lag';" \
        lbin"eza" \
        dl"https://raw.githubusercontent.com/eza-community/eza/main/completions/zsh/_eza -> _eza" \
        id-as"eza" \
    eza-community/eza