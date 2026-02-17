#!/usr/bin/env zsh

zinit light-mode lucid for wait \
        from"gh-r" \
        bpick"atuin-${MACHTYPE}*.tar.gz" \
        mv"atuin*/atuin -> atuin" \
        atclone"
            ./atuin init zsh --disable-up-arrow > init.zsh; 
            ./atuin gen-completions --shell zsh > _atuin" \
        atpull"%atclone" \
        lbin"atuin" \
    @atuinsh/atuin