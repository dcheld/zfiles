#!/usr/bin/env zsh

zinit light-mode wait lucid for \
        sbin"scripts/common.sh -> dotnet-devcerts-linux" \
        nocompile \
        id-as"dotnet-devcerts-linux" \
    @BorisWilhelms/create-dotnet-devcert
