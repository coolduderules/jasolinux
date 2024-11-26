#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

rsync -axHAWXSR --info=progress2 /etc/pacman.d/ /home/jason/jasolinux/files/
rsync -axHAWXSR --info=progress2 /etc/pacman.conf /home/jason/jasolinux/files/
rsync -axHAWXSR --info=progress2 /etc/environment /home/jason/jasolinux/files/
rsync -axHAWXSR --info=progress2 /usr/bin/makepkg /home/jason/jasolinux/files/
rsync -axHAWXS --info=progress2 /home/jason/.config/hypr/ /home/jason/jasolinux/Configs/.config/hypr/
rsync -axHAWXS --info=progress2 /home/jason/.config/hyde/ /home/jason/jasolinux/Configs/.config/hyde/
rsync -axHAWXS --info=progress2 /home/jason/.zshrc /home/jason/jasolinux/Configs/
rsync -axHAWXS --info=progress2 /home/jason/user_configuration.json /home/jason/jasolinux/Configs/
rsync -axHAWXS --info=progress2 /home/jason/user_credentials.json /home/jason/jasolinux/Configs/
