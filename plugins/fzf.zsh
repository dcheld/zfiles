#!/usr/bin/env zsh

zinit light-mode wait lucid nocompletions for \
        from"gh-r" \
        sbin"fzf" \
        id-as"fzf" \
    junegunn/fzf \
        has"tmux" \
        as"null" \
        sbin"fzf-tmux" \
        id-as"fzf-tmux" \
    "https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-tmux"
