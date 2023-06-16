#!/bin/sh
dir1="$(realpath $(dirname $0))/"
dest1="${1:-${dir1}extra_backup}/"

dir="${dir1}pacman/"
dest="${dest1}pacman/"

. "${dir}listfiles.sh"

parsevar "$listfiles" copy

ln -s "$(realpath "${dir1}.git")" "${dest1}.git"
