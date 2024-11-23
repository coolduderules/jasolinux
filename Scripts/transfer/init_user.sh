#!/bin/bash

locale-gen
grub-install --efi-directory=/boot --boot-directory=/boot --removable
grub-mkconfig -o /boot/grub/grub.cfg
pacman --noconfirm -syu git
sed 's/^/#/' /etc/pacman.d/hooks/repo_init.hook > /etc/pacman.d/hooks/repo_init.hook



