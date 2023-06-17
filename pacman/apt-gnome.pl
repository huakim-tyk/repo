#!/usr/bin/env perl

unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

require "apt-gtk.pl";

push @pkgs, "gdm3", "gnome-shell-extensions", 
"gnome-shell-extension-appindicator", "gnome-shell-extensions-extra", 
"gnome-shell-extension-manager", "gnome-control-center", "gnome-menus", 
"gnome-session", "gnome-software", "gnome-tweaks";

unless(caller){
    load(); 
}
