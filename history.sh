
# History
export SAVEHIST=1000
export HISTSIZE=1000
export HISTFILE="$HOME/.zsh_history"

# Not store failed command
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# setopt extended_history       # record timestamp of command in HISTFILE
# setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
# setopt hist_ignore_space      # ignore commands that start with space
# setopt hist_verify            # show command with history expansion to user before running it
# setopt share_history          # share command history data
