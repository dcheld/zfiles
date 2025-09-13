#!/usr/bin/env zsh

zinit light-mode lucid for \
    OMZL::key-bindings.zsh \
        atload"source $ZSH_SRC_DIR/plugins/basics.history.atload.sh" \
    OMZL::history.zsh \
        wait \
    OMZL::completion.zsh