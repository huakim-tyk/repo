#!/bin/sh
user='lenovo'
root='root'
shell='/bin/bash'
groupadd $root
groupadd $user
useradd $user -g $user
useradd $root -g $root
usermod -u 0 $root
usermod -d /home/$user $user
usermod -d /$root $root
rm -R /$root
usermod -a $user -G netdev
usermod -a $user -G plugdev
usermod -a $user -G sudo
usermod -s $shell $user
usermod -s $shell $root
mkhomedir_helper $user
mkhomedir_helper $root
password='$6$9We4mW90FP3l9Gx7$dy4VdP0YQlAjT2o4wkKP515XhwTUzpOj/GB6wb7Zu2gnxJCBk1pVrb2JqQJLXk/YX9k.ZbV/21KEdI7JD6TPR0'
usermod -p $password $root
usermod -p $password $user

