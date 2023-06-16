#!/bin/sh
dir="$(realpath $(dirname $0))/"
dest="${1:-${dir}extra_backup/}"

. ./pacman/copy_func.sh
for i in 'bootstrap-mount' 'bootstrap' 'backup-extra' 'pacman/apt'; do
    copy "$i.sh"
done

dir="${dir}pacman/"
dest="${dest}pacman/"

for i in 'copy' 'script'; do
    parsefile "$i" 'copy'
done
