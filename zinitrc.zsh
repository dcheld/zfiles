#!/usr/bin/env zsh

set -o pipefail

local sourceDir=$(dirname $0)

## Custom scripts
export EDITOR=vim
export PATH
FPATH="$sourceDir/locals/completions/:${FPATH}"

for filename in $(find $sourceDir/locals/scripts/ \
    -type f \
    ! -name .gitkeep \
    -name '*.*')
do
    source "$filename"
done

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
    OMZP::z \
        has'aws' \
    OMZP::aws

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
zinit light-mode depth'1' for \
        atload'_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
        blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions \
        atload"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
         wait lucid \
    @asdf-vm/asdf

## Dotnet
zinit light-mode depth'1' wait lucid for \
        as"null" reset \
        sbin"src/dotnet-install.sh -> dotnet-install" \
    dotnet/install-scripts \
        if'[[ -f "$HOME/.dotnet/dotnet" ]]' \
    memark/zsh-dotnet-completion

## Azure
zinit light-mode wait lucid as"null" blockf for \
        pick'az.completion' \
        atload"zicompinit; zicdreplay;" \
        has"az" \
    "https://github.com/Azure/azure-cli/blob/dev/az.completion"

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
        atclone"cp -f **/man/* $ZPFX/man/man1/" \
        atpull'%atclone' \
        atload"alias man='batman';" \
        sbin"**/bin/*" \
        id-as"bat-extras" \
    @eth-p/bat-extras \
        atload"alias ls='eza --icons';
               alias ll='eza --icons -lagF';
               alias la='eza --icons -lag';" \
        sbin"eza" \
        id-as"eza" \
    eza-community/eza \
        as"completion" \
        id-as"eza-completion" \
        mv"eza-completion -> _eza" \
    "https://raw.githubusercontent.com/eza-community/eza/main/completions/zsh/_eza" \
        nocompletions \
        sbin"fzf" \
        id-as"fzf" \
    junegunn/fzf \
        atclone"cp -f **/fd.1 $ZPFX/man/man1/fd.1;" \
        atpull'%atclone' \
        cp"**/autocomplete/_fd -> _fd" \
        sbin"**/fd" \
        id-as"fd" \
    @sharkdp/fd

unset sourceDir
autoload -Uz compinit
compinit
