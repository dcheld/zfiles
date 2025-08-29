#!/usr/bin/env zsh

## Interactive command depends of fzf.zsh
zinit light-mode from"gh-r" for \
        atclone"
            cp -f man/man1/* $ZPFX/man/man1/;
            ./zoxide init zsh --cmd cd > init.zsh;
        " \
        atpull'%atclone' \
        lbin"zoxide" \
        completions"**/completions/" \
        id-as"zoxide" \
    @ajeetdsouza/zoxide