#!/usr/bin/env perl

unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

require "apt-gui.pl";

push @pkgs, "accountsservice", "ark", "bluedevil", "dolphin-root", 
"gnome-disk-utility", "gwenview", "kde-config-gtk-style", 
"kdeconnect", "kde-config-screenlocker", "kde-config-sddm", "kdialog", 
"kfind", "kio-admin", "kio-extras", "kio-fuse", "knewstuff-dialog", 
"konsole", "kscreen", "kwin-x11", "kwin-wayland", "libvirt-clients", 
"okular", "plasma-desktop", "plasma-nm", "plasma-pa", "plasma-systemmonitor", 
"plasma-workspace", "plasma-workspace-wayland", "powerdevil", 
"pulseaudio", "pulseaudio-module-bluetooth", "sddm", "sddm-theme-breeze",
"systemsettings", "upower", "vlc", "vlc-plugin-access-extra", 
"xdg-desktop-portal-kde";

push @pkgs, "accountwizard", "falkon", "kmail";

unless(caller){
    load();
}
