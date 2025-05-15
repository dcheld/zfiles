#!/usr/bin/env zsh

function init-asdf(){
    export ASDF_DATA_DIR="$HOME/.asdf"
    typeset -g -aU path
    path=("${ASDF_DATA_DIR:-$HOME/.asdf}/shims" $path)
}

zinit light-mode lucid wait from"gh-r" for \
        lbin"asdf" \
        atclone"
            ./asdf completion zsh > _asdf" \
        atpull"%atclone" \
    @asdf-vm/asdf