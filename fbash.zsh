if (( ${#fbash_completion[@]} )); then
    for fbash in "${fbash_completion[@]}"; do
        source "$fbash"
    done
    autoload -U +X bashcompinit && bashcompinit
fi
