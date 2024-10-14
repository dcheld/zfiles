#!/usr/bin/env zsh

set -o pipefail

sourceDir=$(dirname $0)

## Custom scripts
export EDITOR=vim
export PATH

typeset -aU fpath;
fpath=("$sourceDir/locals/completions" $fpath)

source "$sourceDir/aliases.sh"
source "$sourceDir/functions.sh"

__bengin() {
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    source "${ZINIT_HOME}/zinit.zsh"

    zinit light zdharma-continuum/zinit-annex-bin-gem-node
}

__load(){
    local plugin
    for plugin in "$@"; do
        source "$sourceDir/plugins/$plugin.zsh"
    done
}

__load-local() {
    # Read local scripts
    for filename in $(find $sourceDir/locals/scripts/ \
        -type f \
        ! -name .gitkeep \
        -name '*.*')
    do
        source "$filename"
    done
}

__end() {
    unset sourceDir
    unset -f __bengin
    unset -f __load
    unset -f __load-local

    autoload -Uz compinit
    compinit
}
