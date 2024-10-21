#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" completions for \
        wait \
        atclone"cp -f **/man/* $ZPFX/man/man1/" \
        atpull'%atclone' \
        atload"alias man='batman';" \
        lbin"**/bin/*" \
        id-as"bat-extras" \
    @eth-p/bat-extras