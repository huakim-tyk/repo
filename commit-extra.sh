#!/bin/sh
dir1="$(realpath $(dirname $0))/"
dest1="${1:-${dir1}extra_backup}/"
rm -R "${dest1}"

. "${dir1}copy-extra.sh"


ln -sTvf "$(realpath "${dir1}.git")" "${dest1}.git"

(
cd "${dest1}"
git add --all
git commit -m update
git push
)
