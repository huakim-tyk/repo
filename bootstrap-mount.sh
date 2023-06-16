#!/bin/sh
#dhclient
#echo "${0}"
cd "$(dirname ${0})"
dir0="$(pwd)"
dir1="${dir0}/bootstrap"
dir2="${dir1}-${1}"
mkdir -p "${dir2}"
mount "${2}" "${dir2}"
#echo "${2}"
#echo "${dir2}"

cp -RTfvp "${dir1}" "${dir2}"
. "${dir0}/bootstrap.sh" "${1}"
umount "${dir2}"
