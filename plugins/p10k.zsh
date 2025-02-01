#!/usr/bin/env zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#PowerLevel10K
zinit light-mode depth=1 for \
        atload'[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' \
    romkatv/powerlevel10k
