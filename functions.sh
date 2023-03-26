juspark(){
    PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark "$@"
}

pushsync() {
    remote="${1:-origin}"
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream $remote $branch
}

emd5sum() {
    echo -n $@ | md5sum | awk '{print $1}' | xargs echo
}

add() {
    if [ $# -ne 0 ]; then
        git add "$@"
    else
        git add -A :/
    fi
}

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

ziup() {
    if [[ -d "/usr/share/zinit" ]]; then
        sudo git -C "/usr/share/zinit/zinit.git" pull
    elif [[ -d "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" ]]; then
        git -C "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" pull
    fi
}

function keychain-init() {
    keychain --nogui $HOME/.ssh/id_rsa
    keychain --nogui $HOME/.ssh/dheld_id_rsa
    source $HOME/.keychain/$HOSTNAME-sh
}
