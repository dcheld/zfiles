function dbUp(){
    name='vivobd'

    if [[ ! $(sudo podman ps -a -f "name=^$name$" --format '{{.Names}}') == "$name" ]]; then
        podman run -d \
            --name $name \
            -e POSTGRES_PASSWORD=postgres \
            -e PGDATA=/var/lib/postgresql/data/pgdata \
            -p 5432:5432 \
            -v $name:/var/lib/postgresql/data \
            postgres
    else
        podman start $name
    fi
}

function dbDown(){
    name='vivobd'

    if [[ $(sudo podman ps -a -f "name=^$name$" --format '{{.Names}}') == "$name" ]]; then
        sudo podman stop $name
    fi
}

function dbClean(){
    name='vivobd'

    if [[ $(sudo podman ps -a -f "name=^$name$" --format '{{.Names}}') == "$name" ]]; then
        podman rmi -f $name
        podman volume rm $name
    fi
}

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
