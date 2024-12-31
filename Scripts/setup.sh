#!/bin/bash

echo 'Defaults:jason      !authenticate' >> /etc/sudoers
sed -i 's/#auth           sufficient      pam_wheel.so trust use_uid/auth           sufficient      pam_wheel.so trust use_uid/' /etc/pam.d/su
pacman --noconfirm -Syu
echo -ne 'y\ny\n' | pacman -S bubblewrap-suid
mkinitcpio -P
grub-mkconfig -o /boot/grub/grub.cfg
su -c '/home/jason/jasolinux/Scripts/install.sh -drs' jason
sed -i '$ d' /etc/sudoers
sed -i 's/auth           sufficient      pam_wheel.so trust use_uid/#auth           sufficient      pam_wheel.so trust use_uid/' /etc/pam.d/su
