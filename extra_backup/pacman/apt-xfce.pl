#!/usr/bin/env perl

unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

require "apt-gtk.pl";
push @pkgs, "kazam", "lightdm-settings", "network-manager-gnome", 
"libxfce4ui-utils", "xfce4-appfinder", "xfce4-notifyd", "xfce4-panel", 
"xfce4-power-manager", "xfce4-pulseaudio-plugin", "xfce4-session", 
"xfce4-settings", "xfce4-whiskermenu-plugin", "xfce4-xkb-plugin", 
"xfdashboard", "xfdesktop4", "xfwm4";

unless(caller){
    load();
}
