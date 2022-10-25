if (( ${#fbash_completion[@]} )); then
    autoload -U +X bashcompinit && bashcompinit
    for fbash in "${fbash_completion[@]}"; do
        source "$fbash"
    done
fi
