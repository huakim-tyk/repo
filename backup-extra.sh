#!/bin/sh
dir1="$(realpath $(dirname $0))/"
dir="${dir1}pacman/"
dest1="${1:-${dir1}extra_backup}/"
dest="${dest1}pacman/"

rm -R "${dest1}"
. "${dir}listfiles.sh"

ln -s "$(realpath "${dir1}.git")" "${dest1}.git"
(
cd "${dest1}"
git add --all
git commit -m update
git push
)
