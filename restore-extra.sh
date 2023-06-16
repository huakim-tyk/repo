#!/bin/sh
if test -z "$1"; then 
  exit 1
fi

dir="${2:-$(realpath $(dirname $0))/extra_backup}/"
dest="$1"



