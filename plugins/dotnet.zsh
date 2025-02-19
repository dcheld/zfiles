#!/usr/bin/env zsh

## Dotnet
zinit light-mode depth'1' lucid wait for \
        reset \
        as"null" \
        lbin"src/dotnet-install.sh -> dotnet-install" \
    dotnet/install-scripts \
        if'[[ -f "$HOME/.dotnet/dotnet" ]]' \
    memark/zsh-dotnet-completion
