#!/usr/bin/env zsh

set -o pipefail

sourceDir=$(dirname $0)

## Custom scripts
export EDITOR=vim
export PATH

typeset -aU fpath;
fpath=("$sourceDir/completions" $fpath)

source "$sourceDir/aliases.sh"
source "$sourceDir/functions.sh"

__bengin() {
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git";
    source "${ZINIT_HOME}/zinit.zsh";

    zinit light-mode for \
        zdharma-continuum/zinit-annex-bin-gem-node \
        zdharma-continuum/zinit-annex-binary-symlink \
        zdharma-continuum/zinit-annex-patch-dl;
}

__load(){
    local plugin;
    typeset -i i=1

    while (( i <= ${#plugins[@]} )); do
        plugin=${plugins[i]}
        source "$sourceDir/plugins/$plugin.zsh";
        ((i++))
    done
}

__load-local() {
    # Read local scripts
    for filename in $(find $sourceDir/local-scripts/ \
        -type f \
        ! -name .gitkeep \
        -name '*.*')
    do
        source "$filename";
    done
}

__end() {
    unset sourceDir;
    unset plugins;
    unset -f __bengin;
    unset -f __load;
    unset -f __load-local;

    autoload -Uz compinit;
    compinit;
}
