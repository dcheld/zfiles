#!/usr/bin/env zsh

zinit light-mode lucid wait from"gh-r" for \
        atclone"cp -f usage.1 $ZPFX/man/man1/usage.1" \
        lbin"usage" \
    @jdx/usage