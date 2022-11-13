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
zinit lucid for \
    OMZL::key-bindings.zsh \
    OMZL::history.zsh \
    OMZL::completion.zsh \
        wait'1' \
    OMZP::z

#PowerLevel10K
zinit light-mode depth=1 for \
        atload'[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' \
    romkatv/powerlevel10k

## Plugins
zinit light-mode wait lucid depth'1' light-mode for \
       atload'_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zdharma-continuum/zinit-annex-bin-gem-node \
        atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
        wait'1' \
    @asdf-vm/asdf

## Dotnet
zinit light-mode wait'1' lucid as"program" for \
        cp"src/dotnet-install.sh -> dotnet-install" \
        pick"dotnet-install" \
        atload'
            if [[ -d $HOME/.dotnet ]]; then
                export DOTNET_ROOT="$HOME/.dotnet"
                export PATH="$DOTNET_ROOT:$PATH"
            fi' \
    dotnet/install-scripts


## Commands
zinit light-mode as"program" from"gh-r" for \
        atclone"cp -f **/bat $ZPFX/bin/bat;
                cp -f **/bat.1 $ZPFX/man/man1/bat.1;
                cp -f **/autocomplete/bat.zsh _bat" \
        atpull'%atclone' \
    @sharkdp/bat \
        atclone"cp -f bin/exa $ZPFX/bin/exa;
                cp -f man/exa.1 $ZPFX/man/man1/exa.1;
                cp -f man/exa_colors.5 $ZPFX/man/man5/exa_colors.5;
                cp -f completions/exa.zsh _exa" \
        atpull'%atclone' \
     @ogham/exa

autoload -Uz compinit
compinit;
