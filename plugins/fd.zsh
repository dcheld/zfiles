#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" as"null" completions for \
        atclone"cp -f **/fd.1 $ZPFX/man/man1/fd.1;" \
        atpull'%atclone' \
        cp"**/autocomplete/_fd -> _fd" \
        sbin"**/fd" \
        id-as"fd" \
    @sharkdp/fd