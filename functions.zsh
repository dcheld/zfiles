my-scripts-clean(){
    setopt localoptions rm_star_silent

     # Verifica se a variável está definida
    if [[ -z "$ZSH_SRC_DIR_CACHE" ]]; then
        echo "[ERRO] ZSH_SRC_DIR_CACHE não está definido."
        return 1
    fi

    # Verifica se o diretório existe
    if [[ ! -d "$ZSH_SRC_DIR_CACHE" ]]; then
        echo "[ERRO] Diretório não existe: $ZSH_SRC_DIR_CACHE"
        return 1
    fi

    # Proteção: nunca permitir "/" ou diretório home inteiro
    if [[ "$ZSH_SRC_DIR_CACHE" == "/" || "$ZSH_SRC_DIR_CACHE" == "$HOME" ]]; then
        echo "[ERRO] Diretório inseguro: $ZSH_SRC_DIR_CACHE"
        return 1
    fi

    # Lista o que vai ser removido
    echo "[INFO] Limpando conteúdo de: $ZSH_SRC_DIR_CACHE"
    ls -A "$ZSH_SRC_DIR_CACHE"

    # Apaga de fato
    rm -rf -- "$ZSH_SRC_DIR_CACHE"/* 2>/dev/null
}

my-scripts-compile(){
    find $ZSH_SRC_DIR -type d -name ".git" -prune -o -type d -print | while read dir; do
        mkdir -p "${ZSH_SRC_DIR_CACHE}${dir/$ZSH_SRC_DIR/}"
    done

    local fileToCompile
    for fileToCompile in ${ZSH_SRC_DIR}/**/*.zsh; do
        local fileCompiled=${fileToCompile/$ZSH_SRC_DIR/$ZSH_SRC_DIR_CACHE}
        zcompile -R -- "$fileCompiled".zwc "$fileToCompile" && echo "[zcompile] $fileCompiled.zwc compilado com sucesso.";
    done
}

function zcompile-many() {
    local f
    for f; do
        mkdir -p $ZSH_SRC_DIR_CACHE
        zcompile -R -- "$f".zwc "$f" && echo "[zcompile] $f compilado com sucesso.";
    done
}

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