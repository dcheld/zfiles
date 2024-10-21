#!/usr/bin/env zsh

zinit light-mode wait lucid nocompletions for \
        from"gh-r" \
        lbin"fzf" \
        id-as"fzf" \
    junegunn/fzf \
        has"tmux" \
        as"null" \
        lbin"fzf-tmux" \
        id-as"fzf-tmux" \
    "https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-tmux"
