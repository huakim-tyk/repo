#!/bin/sh
dir="$(realpath $(dirname $0))/"
dest="${1:-${dir}extra_backup}/"
rm -R "${dest}"
. ./pacman/copy_func.sh
for i in 'bootstrap-mount' \
 'bootstrap' ''\
 'backup-extra' \
 'restore-extra'; do
    copy "$i.sh"
done

bkdest="${dest}"
bkdir="${dir}"
dest="${dest}pacman/"
dir="${dir}pacman/"

for i in 'copy' 'script'; do
    parsefile "$i" 'copy'
done

ln -s "${bkdir}extra_repo/.git" "${bkdest}.git"
(
cd "${bkdest}"
git add --all
git commit -m update
git push
)
