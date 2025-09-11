#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" wait for \
        bpick"eza*;man-*;completions-*;" \
        atclone'rm target/completions-*/eza' \
        atpull'%atclone' \
        mv"
            target/man*/eza.1 -> $ZPFX/man/man1/;
            target/man*/eza*.5 -> $ZPFX/man/man5/;" \
        completions'target/completions-*/' \
        lbin'eza' \
        atload"alias ls='eza --color=always --icons=auto';
               alias ll='eza --color=always --icons=auto -lagF';
               alias la='eza --color=always --icons=auto -lag';" \
        id-as'eza' \
    eza-community/eza