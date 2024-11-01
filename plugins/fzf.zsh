#!/usr/bin/env zsh

zinit light-mode wait lucid nocompletions for \
        from"gh-r" \
        dl"https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-tmux" \
        lbin"fzf fzf-tmux" \
        id-as"fzf" \
    junegunn/fzf
