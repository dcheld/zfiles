#!/usr/bin/env zsh

zinit light-mode depth'1' lucid for \
        wait \
        atload"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting