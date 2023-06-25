#!/bin/sh
#dhclient

smp="$(realpath $(dirname $0))"
cd "${smp}"
echo $(pwd)
dir="bootstrap-$1"
if ! [ -d "bootstrap" ]; then
  debootstrap --variant=minbase trixie bootstrap http://deb.debian.org/debian/
fi
cp -RTfvpu bootstrap "$dir"
cd "$dir"

i(){
 d=$2
 if test -z $d; then
  d=$1
 fi
 mkdir $1 -pv
 mount /$d $1/ --bind
}


i dev
i proc
i sys
i extra "${smp}"
#chroot . /bin/bash
chroot . /bin/dpkg --add-architecture i386
chroot . /bin/bash /extra/pacman/aptat.sh
chroot . /bin/perl /extra/pacman/apt-$1.pl
chroot . /bin/bash /extra/pacman/copy.sh
chroot . /bin/bash /extra/pacman/user.sh
chroot . /bin/bash /extra/pacman/aptdt.sh
umount dev proc sys extra
