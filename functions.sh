juspark(){
    PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS=notebook pyspark "$@"
}

pushsync() {
    remote="${upstream:-origin}"
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream $@ $remote $branch
}

emd5sum() {
    echo -n $@ | md5sum | awk '{print $1}'
}

add() {
    if [ $# -ne 0 ]; then
        git add "$@"
    else
        git add -A :/
    fi
}