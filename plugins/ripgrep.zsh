#!/usr/bin/env zsh

zinit light-mode lucid from"gh-r" for \
        wait \
        atclone"cp **/rg.1 $ZPFX/man/man1/;" \
        atpull'%atclone' \
        lbin"**/rg" \
        completions"**/complete/" \
        atload"alias grep='rg --color=auto'" \
        id-as"ripgrep" \
    BurntSushi/ripgrep