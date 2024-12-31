#!/usr/bin/bash

pacman --noconfirm -Syu
echo -ne 'y\ny\n' | pacman -S bubblewrap-suid
mkinitcpio -P
grub-mkconfig -o /boot/grub/grub.cfg
su -c '/home/jason/jasolinux/Scripts/install.sh -drs' jason
