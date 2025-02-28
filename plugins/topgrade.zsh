#!/usr/bin/env zsh

zinit light-mode wait lucid for \
        from"gh-r" \
        atclone"
            ./topgrade --gen-completion zsh > _topgrade;
            ./topgrade --gen-manpage > $ZPFX/man/man1/topgrade.1" \
        atpull"%atclone" \
        lbin"topgrade" \
    topgrade-rs/topgrade
