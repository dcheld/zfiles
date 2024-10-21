#!/usr/bin/env zsh

## Dotnet
zinit light-mode depth'1' lucid for \
        wait \
        as"null" \
        lbin"src/dotnet-install.sh -> dotnet-install" \
    dotnet/install-scripts \
        wait \
        if'[[ -f "$HOME/.dotnet/dotnet" ]]' \
    memark/zsh-dotnet-completion