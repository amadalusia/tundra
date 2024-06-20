# shellcheck disable=SC2148

qp() {
    if [ -z "${#+x}" ]
    then
        MESSAGE="$(date)"
    else
        MESSAGE="$1"
    fi
        
    git add .
    git commit -m "$MESSAGE"
    git push origin main
}

