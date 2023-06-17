#!/bin/sh
dir1="$(realpath $(dirname $0))/"
dir="${dir1}pacman/"
. "${dir}listfiles.sh"

(
cd "${dir1}"
for i in $listfiles; do
    git add "$(realpath --relative-to=. pacman/${i})"
done
git commit -m update
git push
)