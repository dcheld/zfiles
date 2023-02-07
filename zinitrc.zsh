#!/usr/bin/env zsh

set -o pipefail

local sourceDir=$(dirname $0)
export EDITOR=vim

## Custom scripts
source "$sourceDir/aliases.sh"
source "$sourceDir/functions.sh"

if [[ -d "/usr/share/zinit" ]]; then
    ZINIT_HOME="/usr/share/zinit/zinit.git"
else
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
fi
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
#Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zinit light-mode depth=1 for \
        atload'[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' \
    romkatv/powerlevel10k

## Plugins
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light-mode wait lucid depth'1' for \
       atload'_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
        atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
        wait'1' \
    @asdf-vm/asdf

## Dotnet
zinit light-mode wait lucid for \
        as"null" \
        sbin"src/dotnet-install.sh -> dotnet-install" \
    dotnet/install-scripts \
        has'dotnet' \
    memark/zsh-dotnet-completion


## Commands
zinit light-mode wait lucid from"gh-r" as"null" for \
        atclone"cp -f **/bat.1 $ZPFX/man/man1/bat.1;
                cp -f **/autocomplete/bat.zsh _bat" \
        atpull'%atclone' \
        atload"alias cat='bat';
               alias bd='batdiff';" \
        sbin"**/bat" \
        id-as"bat" \
    @sharkdp/bat \
        atclone"cp -f man/exa.1 $ZPFX/man/man1/exa.1;
                cp -f man/exa_colors.5 $ZPFX/man/man5/exa_colors.5;
                cp -f completions/exa.zsh _exa" \
        atpull'%atclone' \
        atload"alias ls='exa --icons';
               alias ll='exa --icons -lagF';
               alias la='exa --icons -lag';" \
        sbin"bin/exa" \
        id-as"exa" \
    ogham/exa

unset sourceDir
autoload -Uz compinit
compinit;
