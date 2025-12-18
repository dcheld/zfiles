#!/usr/bin/env zsh

#Dependents
plugins+=("usage-jdx")

zinit light-mode lucid wait from"gh-r" for \
        mv"mise*->mise" \
        atclone"
            ./mise activate zsh | sed 's#\./mise#mise#' > init.zsh;
            ./mise completion zsh | sed 's#\./mise#mise#'  > _mise;" \
        atpull"%atclone" \
        lbin"mise" \
        id-as"mise" \
    @jdx/mise