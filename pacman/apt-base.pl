#!/usr/bin/env perl

unless(caller){
    use File::Basename;
    use lib dirname($0);
    our @pkgs;
}

push @pkgs, "apt-file", "apt-rdepends", "at-spi2-core", "apt-utils", 
"ca-certificates", "console-setup", "dosfstools", "dpkg", "dpkg-repack", 
"dpkg-dev", "file", "grub-efi-amd64", "grub-pc-bin", "grub-efi-ia32-bin", 
"inetutils-ping", "inetutils-traceroute", "inotify-tools", "initramfs-tools", 
"isc-dhcp-client", "less", "locales", "lsof", "nano", "net-tools", 
"network-manager", "network-manager-openvpn", "ntfs-3g", "pciutils", 
"psmisc", "refractainstaller-base", "refractasnapshot-base", "rfkill", 
"software-properties-common", "systemd", "systemd-resolved", "systemd-sysv", 
"sudo", "usr-is-merged", "whois", "whiptail", "wpasupplicant";


push @pkgs,
"firmware-misc-nonfree",
"firmware-realtek",
"firmware-linux-free",
"firmware-iwlwifi",
"linux-image-liquorix-amd64";


our sub load{
    system("apt-get", "install", "--reinstall", "--allow-downgrades", "-y", @pkgs, @_); 
}

unless(caller){
    load();
}
