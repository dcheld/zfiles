#!/usr/bin/env zsh

zinit light-mode lucid for wait \
        from"gh-r" \
        bpick"atuin-*.tar.gz" \
        mv"atuin*/atuin -> atuin" \
        lbin"atuin" \
        atclone"
            ./atuin init zsh --disable-up-arrow > init.zsh; 
            ./atuin gen-completions --shell zsh > _atuin" \
        atpull"%atclone" \
        src"init.zsh" \
    @atuinsh/atuin