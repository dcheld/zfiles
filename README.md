# zfiles

## Basic configuration

```zsh
source "$HOME/.dotfiles/import.zsh"

__bengin;

    typeset -aU plugins;
    local plugins=(
        basics

        atuin
        zsh-autosuggestions
        fast-syntax-highlighting
        zsh-completions
        z
        zoxide

        dotnet
        dotnet-devcerts-linux
        asdf
        azure

        bat
        fzf
        bat-extras
        eza
        fd
        ripgrep
        topgrade

        distrobox.completions

        pacman-contrib

        # themes
        p10k
        agnoster.theme
        "oh-my-posh jandedobbeleer"
        "starship gruvbox-rainbow"

        #test
        zunit # depends from resolver
        revolver 
    );

    __load;
    __load-local;
__end;
```