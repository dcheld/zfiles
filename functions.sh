function juspark(){
    PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark "$@"
}

function pushsync() {
    remote="${1:-origin}"
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream $remote $branch
}

function emd5sum() {
    echo -n $@ | md5sum | awk '{print $1}' | xargs echo
}

function add {
    if [ $# -ne 0 ]; then
        git add "$@"
    else
        git add -A :/
    fi
}

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
