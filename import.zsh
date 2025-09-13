#!/usr/bin/env zsh
set -o pipefail

export ZSH_SRC_DIR=$(dirname $0)
export ZSH_SRC_DIR_CACHE="$HOME/.cache/dotfiles"

## Custom scripts
export EDITOR=vim


typeset -aU fpath;
fpath=("$ZSH_SRC_DIR/completions" $fpath)

source "$ZSH_SRC_DIR/aliases.zsh"
source "$ZSH_SRC_DIR/functions.zsh"

__bengin() {
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git";
    source "${ZINIT_HOME}/zinit.zsh";

    typeset -g -aU path;
    path=("$ZPFX/bin" $path)
    zinit light-mode for \
        zdharma-continuum/zinit-annex-bin-gem-node \
        zdharma-continuum/zinit-annex-binary-symlink \
        zdharma-continuum/zinit-annex-patch-dl;
}

__load(){
    local plugin;
    typeset -i i=1

    while (( i <= ${#plugins[@]} )); do
        plugin=(${=plugins[i]})
        source "$ZSH_SRC_DIR/plugins/${plugin[1]}.zsh" "${plugin[@]:1}";
        ((i++))
    done
}

__load-local() {
    # Read local scripts
    for filename in $(find $ZSH_SRC_DIR/local-scripts/ \
        -type f \
        ! -name .gitkeep \
        -name '*.*')
    do
        source "$filename";
    done
}

__end() {
    unset plugins;
    unset -f __bengin;
    unset -f __load;
    unset -f __load-local;
    unset -f __end;

    autoload -Uz compinit;
    compinit;
}
