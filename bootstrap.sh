#!/bin/bash
#dhclient

cd "$(dirname $0)"
echo $(pwd)
dir="bootstrap-$1"
if ! [ -d "$dir" ]; then
  cp -RTfvp bootstrap "$dir"
fi
cd "$dir"

i(){
 mkdir $1 -pv
 mount /$1 $1/ --bind
}


i dev
i proc
i sys
i extra
chroot . /bin/dpkg --add-architecture i386
chroot . /bin/bash /extra/pacman/aptat.sh
chroot . /bin/perl /extra/pacman/apt-$1.pl
chroot . /bin/bash /extra/pacman/copy.sh
chroot . /bin/bash /extra/pacman/user.sh
chroot . /bin/bash /extra/pacman/aptdt.sh
umount dev proc sys extra
