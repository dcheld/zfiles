#!/usr/bin/env zsh

set -o pipefail

local sourceDir=$(dirname $0)
export EDITOR=vim

## Custom scripts
source "$sourceDir/aliases.sh"
source "$sourceDir/functions.sh"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

## OZH
zinit light-mode lucid for \
    OMZL::key-bindings.zsh \
        atload'source $sourceDir/history.sh' \
    OMZL::history.zsh \
    OMZL::completion.zsh \
        wait \
    OMZP::z

#PowerLevel10K
zinit light-mode depth=1 for \
        atinit'
            #Instant prompt
            if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
              source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
            fi
        ' \
        atload'[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' \
    romkatv/powerlevel10k

## Plugins
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light-mode lucid depth'1' for \
       blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
        wait'1' \
    @asdf-vm/asdf

## Dotnet
zinit light-mode wait lucid for \
        as"null" reset \
        sbin"src/dotnet-install.sh -> dotnet-install" \
    dotnet/install-scripts \
        has'dotnet' \
    memark/zsh-dotnet-completion

## Azure
zinit light-mode wait lucid as"null" blockf for \
        pick'az.completion' atload"zicompinit; zicdreplay;" has"az" \
    https://github.com/Azure/azure-cli/blob/dev/az.completion

## Commands
zinit light-mode wait lucid from"gh-r" as"null" completions for \
        atclone"cp -f **/bat.1 $ZPFX/man/man1/bat.1" \
        atpull'%atclone' \
        atload"alias cat='bat';
               alias bd='batdiff';" \
        cp"**/autocomplete/bat.zsh -> _bat" \
        sbin"**/bat" \
        id-as"bat" \
    @sharkdp/bat \
        atclone"cp -f man/exa.1 $ZPFX/man/man1/exa.1;
                cp -f man/exa_colors.5 $ZPFX/man/man5/exa_colors.5;" \
        atpull'%atclone' \
        atload"alias ls='exa --icons';
               alias ll='exa --icons -lagF';
               alias la='exa --icons -lag';" \
        cp"completions/exa.zsh -> _exa" \
        sbin"bin/exa" \
        id-as"exa" \
    ogham/exa \
        nocompletions \
        sbin"fzf" \
        id-as"fzf" \
    junegunn/fzf-bin \
        atclone"cp -f **/fd.1 $ZPFX/man/man1/fd.1;" \
        atpull'%atclone' \
        cp"**/autocomplete/_fd -> _fd" \
        sbin"**/fd" \
        id-as"fd" \
    @sharkdp/fd

unset sourceDir
autoload -Uz compinit
compinit
