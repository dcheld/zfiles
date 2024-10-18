#!/usr/bin/env zsh

## Interactive command depends of fzf.zsh
zinit light-mode from"gh-r" as"null" completions for \
        atclone" \
            cp -f man/man1/* $ZPFX/man/man1/; \
            ./zoxide init zsh --cmd cd > zoxide_init.zsh; \
        " \
        atpull'%atclone' \
        sbin"zoxide" \
        src"zoxide_init.zsh" \
        id-as"zoxide" \
    @ajeetdsouza/zoxide