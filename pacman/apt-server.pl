#!/usr/bin/env perl

unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

push @pkgs, "at-spi2-core", "dosfstools", "dpkg", "file", 
"inetutils-ping",
"inetutils-traceroute", "initramfs-tools", 
"isc-dhcp-client", "less", "locales", "nano", "net-tools", 
"network-manager", "network-manager-openvpn", "pciutils", 
"psmisc", "rfkill", "ssh", "sshfs", "curlftpfs" 
"systemd-resolved", "systemd-sysv", 
"sudo", "usr-is-merged", "whois", "whiptail", "wpasupplicant";


push @pkgs,
"linux-image-liquorix-amd64";


our sub load{
    system("apt-get", "install", "--reinstall", "--allow-downgrades", "-y", @pkgs, @_); 
}

unless(caller){
    load();
}
