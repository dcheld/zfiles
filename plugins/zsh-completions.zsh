#!/usr/bin/env zsh

zinit light-mode depth'1' lucid for \
        wait blockf \
        atload"zicompinit; zicdreplay" \
    zsh-users/zsh-completions