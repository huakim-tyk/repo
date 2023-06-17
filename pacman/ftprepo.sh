#!/bin/sh
dir="$(realpath $(dirname $0))/"

perl "${dir}clonerepo.pl"

echo "${dir}vsftpd.conf"

/usr/sbin/vsftpd "${dir}vsftpd.conf" "-oanon_root=${dir}var/lib/apt/local/repo/" "${@}" 
