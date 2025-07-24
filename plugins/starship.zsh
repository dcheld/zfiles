#!/usr/bin/env zsh

local theme=${1:-gruvbox-rainbow}
zinit light-mode lucid completions from"gh-r" for \
        atclone"
            ./starship init zsh > init.zsh;
            ./starship completions zsh > _starship
            if [[ -n "$theme" ]]; then
                ./starship preset "$theme" -o $HOME/.config/starship.toml
            fi" \
        atpull"%atclone" \
        lbin'starship' \
        src"init.zsh" \
    @starship/starship