#!/usr/bin/bash

pacman --noconfirm -Syu
pacman --noconfirm -U /home/jason/jasolinux/pkgs/apple-firmware-1-1-any.pkg.tar.zst
systemctl enable iptables ip6tables systemd-networkd systemd-resolved iwd sshd

echo -ne 'y\ny\n' | pacman -S bubblewrap-suid
mkinitcpio -P
grub-mkconfig -o /boot/grub/grub.cfg
su -c "echo -ne '1111\n' | /home/jason/jasolinux/Scripts/install.sh -drs" jason
