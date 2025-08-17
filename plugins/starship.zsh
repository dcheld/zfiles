#!/usr/bin/env zsh

local theme=${1:-gruvbox-rainbow}
zinit light-mode lucid completions from"gh-r" for \
        atclone"
            ./starship init zsh > init.zsh;
            ./starship completions zsh > _starship;
            mkdir -p themes;" \
        atpull"%atclone" \
        atinit"
            if [[ ! -f themes/${theme} ]]; then
                rm -rf themes/* > /dev/null 2>&1;
                ./starship preset ${theme} -o $HOME/.config/starship.toml \
                    && touch themes/${theme};
            fi" \
        lbin'starship' \
    @starship/starship