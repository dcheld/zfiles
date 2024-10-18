#!/usr/bin/env zsh

## Interactive command depends of fzf.zsh
zinit light-mode from"gh-r" as"null" completions for \
        atclone"cp -f man/man1/* $ZPFX/man/man1/;" \
        atpull'%atclone' \
        sbin"zoxide" \
        atload'eval "$(zoxide init zsh --cmd cd)"' \
        id-as"zoxide" \
    @ajeetdsouza/zoxide