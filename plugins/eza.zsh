#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" completions for \
        wait \
        atload"alias ls='eza --color=always --icons=auto';
               alias ll='eza --color=always --icons=auto -lagF';
               alias la='eza --color=always --icons=auto -lag';" \
        lbin"eza" \
        dl"https://raw.githubusercontent.com/eza-community/eza/main/completions/zsh/_eza -> _eza" \
        id-as"eza" \
    eza-community/eza