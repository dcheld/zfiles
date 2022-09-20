[[ -f $HOME/.asdf/asdf.sh ]] && source $HOME/.asdf/asdf.sh

if command -v asdf &> /dev/null; then
    fpath=(${ASDF_DIR}/completions $fpath)
    autoload -Uz compinit && compinit
fi

