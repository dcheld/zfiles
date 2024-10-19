#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" completions for \
        wait \
        atclone"cp -f **/bat.1 $ZPFX/man/man1/bat.1" \
        atpull'%atclone' \
        atload"alias cat='bat'" \
        cp"**/autocomplete/bat.zsh -> _bat" \
        sbin"**/bat" \
        id-as"bat" \
    @sharkdp/bat