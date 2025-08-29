#!/usr/bin/env zsh

# atclone"./fzf --zsh > _fzf;" \ Not working
zinit light-mode wait lucid nocompletions for \
        from"gh-r" \
        dl"https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-tmux" \
        dl"https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-preview.sh->fzf-preview" \
        lbin'fzf fzf-tmux' \
        lbin'fzf-preview->fzf-preview.sh' \
        atload"alias fzf-full=\"fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'\"" \
        id-as"fzf" \
    junegunn/fzf
