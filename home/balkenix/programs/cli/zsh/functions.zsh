gp() {
    if ! [ -e $1 ]; then
        git push -u origin/main
	return 1
    fi
    git push $1
    return 1
}

gc() {
    if ! [ -e $1]; then
	git commit -m "$(date)"
	return 1
    fi
    return 1
}

gs() {
    if ! [ -e $1]; then
	git add .
    fi

    git add $1
}
