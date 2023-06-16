#!/bin/sh
dir="$(realpath $(dirname $0))/"
dest="${1}/"

. ./copy_func.sh

parsefile 'apt.list' 'cldir'
copy 'etc/apt'
