#!/usr/bin/env zsh

set -o pipefail

local sourceDir=$(dirname $0)
export EDITOR=vim

## Custom scripts
source "$sourceDir/aliases.sh"
source "$sourceDir/functions.sh"

unset sourceDir

if [[ -d "/usr/share/zinit" ]]; then
    ZINIT_HOME="/usr/share/zinit/zinit.git"
else
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
fi
source "${ZINIT_HOME}/zinit.zsh"


## OZH
zinit for \
    OMZL::key-bindings.zsh \
    OMZL::history.zsh \
    OMZL::completion.zsh

zinit wait'1' lucid for \
    OMZP::z

#PowerLevel10K
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Plugins
zinit ice wait depth'1' lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice depth'1' lucid
zinit light zsh-users/zsh-completions

zinit ice wait='1' depth=1 lucid
zinit light asdf-vm/asdf

## Dotnet
zinit ice lucid wait'1' as"program" \
    cp"src/dotnet-install.sh -> dotnet-install" \
    pick"dotnet-install"
zinit light dotnet/install-scripts

if [[ -d $HOME/.dotnet ]]; then
    export DOTNET_ROOT="$HOME/.dotnet"
    export PATH="$DOTNET_ROOT:$PATH"
fi

## bat
zinit ice as"program" from"gh-r" \
    atclone"cp -f **/bat $ZPFX/bin/bat;
            cp -f **/bat.1 $ZPFX/man/man1/bat.1;
            cp -f **/autocomplete/bat.zsh _bat" \
    atpull'%atclone'
zinit light @sharkdp/bat

## exa
zinit ice as"program" from"gh-r" \
    atclone"cp -f bin/exa $ZPFX/bin/exa;
            cp -f man/exa.1 $ZPFX/man/man1/exa.1;
            cp -f man/exa_colors.5 $ZPFX/man/man5/exa_colors.5;
            cp -f completions/exa.zsh _exa" \
    atpull'%atclone'
zinit light @ogham/exa

autoload -Uz compinit
compinit;
