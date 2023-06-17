#!/usr/bin/env perl

unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

require "apt-gui.pl";

push @pkgs, "evince", "celluloid", "eog", "file-roller", 
"gnome-disk-utility", "gnome-system-monitor", 
"gvfs-backends", "gvfs-daemons", "gvfs-fuse", 
"network-manager-openvpn-gnome", "policykit-1-gnome", 
"qt5-style-plugins", "redshift", "thunar", 
"thunar-volman", "thunar-archive-plugin", 
"xfce4-terminal";

$gst="gstreamer1.0-plugins";

push @pkgs, "evolution", "epiphany-browser";

push @pkgs, "${gst}-bad", "${gst}-good", "${gst}-base", "${gst}-ugly";

unless(caller){
    load();
}
