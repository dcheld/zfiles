#!/usr/bin/env zsh

zinit light-mode wait lucid for \
        atclone$'
            local NAME=$(awk -F= \'$1=="ID" { print $2 ;}\' /etc/os-release | tr "[:upper:]" "[:lower:]")
            cp "scripts/$NAME-create-dotnet-devcert.sh" scripts/dotnet-devcerts-linux' \
        atpull'%atclone' \
        sbin'scripts/dotnet-devcerts-linux' \
        nocompile \
        id-as"dotnet-devcerts-linux" \
    @BorisWilhelms/create-dotnet-devcert
