#!/bin/sh
if test -z "$dir1"; then 
    if test -z "$1"; then
        exit 1
    fi
    dir1="$(realpath $(dirname $0))/"
    dest1="${1}/"
fi

dir="${dir1}pacman/"
dest="${dest1}pacman/"

. "${dir}listfiles.sh"

parsevar "$listfiles" copy

ln -s "$(realpath "${dir1}.git")" "${dest1}.git"
