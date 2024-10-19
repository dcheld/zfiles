#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" completions for \
        wait \
        atclone"cp -f **/fd.1 $ZPFX/man/man1/fd.1;" \
        atpull'%atclone' \
        sbin"**/fd" \
        id-as"fd" \
    @sharkdp/fd