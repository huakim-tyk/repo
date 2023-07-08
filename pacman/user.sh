#!/bin/sh

if [ -z "$new_user"]; then
 echo -n 'User: '
 read user
else
 user="$new_user"
fi

if [ -z "$new_pswd"]; then
 password="$(mkpasswd)"
else
 password="$new_pswd"
fi

root='root'
shell='/bin/bash'
groupadd "$root"
groupadd "$user"
useradd "$user" -g "$user"
useradd "$root" -g "$root"
usermod -u 0 "$root"
usermod -d "/home/$user" "$user"
usermod -d "/$root" "$root"
rm -R "/$root"
groupadd netdev
groupadd plugdev
groupadd sudo
usermod -a "$user" -G netdev
usermod -a "$user" -G plugdev
usermod -a "$user" -G sudo
usermod -s "$shell" "$user"
usermod -s "$shell" "$root"
mkhomedir_helper "$user"
mkhomedir_helper "$root"
usermod -p "$password" "$root"
usermod -p "$password" "$user"

