#!/usr/bin/env zsh

## Azure
zinit light-mode wait lucid as"null" blockf for \
        pick'az.completion' \
        atload"zicompinit; zicdreplay;" \
        has"az" \
    "https://github.com/Azure/azure-cli/blob/dev/az.completion"