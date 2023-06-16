#!/bin/sh
dir="$(realpath $(dirname $0))/"
dest="${1:-${dir}extra_backup}/"

rm -R "${dest}"
. ./pacman/copy_func.sh

copysh(){
    copy "$1.sh"
}

parsefile "pacman/extra.list" copysh

(
dest="${dest}pacman/"
dir="${dir}pacman/"

for i in 'copy' 'script'; do
    parsefile "$i.list" 'copy'
done
)

ln -s "$(realpath "${dir}.git")" "${dest}.git"
(
cd "${dest}"
git add --all
git commit -m update
git push
)
