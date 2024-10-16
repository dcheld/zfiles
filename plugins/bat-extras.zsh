#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" as"null" completions for \
        wait \
        atclone"cp -f **/man/* $ZPFX/man/man1/" \
        atpull'%atclone' \
        atload"alias man='batman';" \
        sbin"**/bin/*" \
        id-as"bat-extras" \
    @eth-p/bat-extras