#!/usr/bin/env zsh

zinit light-mode for \
    OMZL::key-bindings.zsh \
        atload"source $sourceDir/plugins/basics.history.atload.sh" \
    OMZL::history.zsh \
        lucid wait \
    OMZL::completion.zsh