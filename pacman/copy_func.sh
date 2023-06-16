#!/bin/sh

copy(){
  rsync --mkpath -aixHAX "$dir$1" "$dest${1:-$2}"
}

link(){
 f="$dest${1:-$2}"
 rm -Rfv "$f"
 ln -sTfv "$dir$1" "$f"
}

cldir(){
 f="$dest${1}"
 rm -Rvf "$f"
 mkdir -p "$f"
}

parse(){
  while read line; do
    $1 $line
  done
}

parsefile(){
    sed -n '/^[[:space:]]*#/!p' "$dir$1" | parse "$2"
}
