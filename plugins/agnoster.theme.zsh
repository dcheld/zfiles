#!/usr/bin/env zsh

#Dependents
plugins+=("git.lib")

zinit light-mode for \
        atinit"setopt prompt_subst" \
    OMZT::agnoster
