#!/usr/bin/env zsh

zinit light-mode depth'1' lucid for wait \
        atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting