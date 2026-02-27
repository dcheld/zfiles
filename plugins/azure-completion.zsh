#!/usr/bin/env zsh

# needs OMZL::completion.zsh -  autoload -U +X bashcompinit && bashcompinit
## Azure
zinit light-mode lucid as"null" blockf for \
        wait \
        pick'az.completion' \
        has"az" \
    "https://github.com/Azure/azure-cli/blob/dev/az.completion"