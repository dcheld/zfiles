#!/usr/bin/env zsh

## Dotnet
zinit light-mode depth'1' for \
        as"null" reset \
        sbin"src/dotnet-install.sh -> dotnet-install" \
    dotnet/install-scripts \
        if'[[ -f "$HOME/.dotnet/dotnet" ]]' \
    memark/zsh-dotnet-completion