#!/usr/bin/env zsh

zinit light-mode for \
        from"gh-r" \
        bpick"atuin-*.tar.gz" \
        mv"atuin*/atuin -> atuin" \
        sbin"atuin" \
        atclone"
            ./atuin init zsh --disable-up-arrow > init.zsh; 
            ./atuin gen-completions --shell zsh > _atuin" \
        atpull"%atclone" \
        src"init.zsh" \
    @atuinsh/atuin