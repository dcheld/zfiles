#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" for \
        wait \
        atclone"cp -f **/fd.1 $ZPFX/man/man1/fd.1;" \
        atpull'%atclone' \
        lbin"**/fd" \
        completions"**/autocomplete/" \
        id-as"fd" \
    @sharkdp/fd