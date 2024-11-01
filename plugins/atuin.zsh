#!/usr/bin/env zsh

zinit light-mode for \
        as"command" from"gh-r" \
        bpick"atuin-*.tar.gz" \
        mv"atuin*/atuin -> atuin" \
        sbin"atuin" \
        atclone"
            ./atuin init zsh > init.zsh; 
            ./atuin gen-completions --shell zsh > _atuin" \
        atpull"%atclone" \
        src"init.zsh" \
        as-id"atuin" \
    atuinsh/atuin