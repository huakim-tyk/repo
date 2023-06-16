#!/usr/bin/env perl
unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

require "apt-base.pl";

push @pkgs, "dbus-x11", "geany", "gnome-themes-extra", "menulibre", 
"ovmf", "libvirt-clients", "pavucontrol", "plymouth-themes", "pulseaudio", 
"pulseaudio-module-bluetooth", "qemu-system-gui", "qemu-system-x86", 
"refractainstaller-gui", "refractasnapshot-gui", "xorg", 
"xserver-xephyr";

unless(caller){
    load();
}
