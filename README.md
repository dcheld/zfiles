# zfiles

## Basic configuration

```zsh
source "$HOME/.dotfiles/import.zsh"

__bengin;

    typeset -aU plugins;
    local plugins=(
        "basics"

        "atuin"
        "zsh-autosuggestions"
        "fast-syntax-highlighting"
        "zsh-completions"
        "z"
        "zoxide"

        "dotnet"
        "dotnet-devcerts-linux"
        "asdf"
        "azure"

        "bat"
        "fzf"
        "bat-extras"
        "eza"
        "fd"

        "distrobox.completions"
        
        "pacman-contrib"

        # themes
        "p10k"
        "agnoster.theme"
    );

    __load;
    __load-local;
__end;
```

### Instant prompt `p10k`

```zsh
#PowerLevel10K-Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
```