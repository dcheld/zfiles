#!/usr/bin/env zsh

zinit light-mode lucid for \
    OMZL::key-bindings.zsh \
        atload"source $sourceDir/plugins/basics.history.atload.sh" \
    OMZL::history.zsh \
        wait \
    OMZL::completion.zsh