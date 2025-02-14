#!/usr/bin/env zsh

## Dotnet
zinit light-mode depth'1' lucid for \
        wait \
        as"null" \
        cp"src/dotnet-install.sh -> dotnet-install" \
        lbin"dotnet-install" \
    dotnet/install-scripts \
        wait \
        if'[[ -f "$HOME/.dotnet/dotnet" ]]' \
    memark/zsh-dotnet-completion