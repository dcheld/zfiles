alias _='sudo -E'
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias la='ls -la'

# Git
alias g=git
alias st='git status'
alias push='git push'
alias pull='git pull'
alias log='git log'
alias ci='git commit'
alias co='git checkout'
alias dif='git diff'
alias rs='git reset'
alias rb='git rebase'
alias fixup='git fixup'
alias branch='git branch'
alias branches='git branch -a'
alias tag='git tag'
alias up='git up'
alias sync='git sync'
alias gitroot='cd "$(git rev-parse --show-toplevel)"'

#Zinit
alias zinit-clean="rm -rf \"$HOME\"/.local/share/zinit/{completions,plugins,polaris,services,snippets}"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
