#!/bin/bash

cd /home/jason
git clone https://github.com/coolduderules/jasolinux.git
cd /home/jason/jasolinux/Scripts
sudo pacman -Fyy
sudo pacman -Syy
sudo rm -rf /home/jason/jasorepo/jasorepo.*
repo-add /home/jason/jasorepo/jasorepo.db.tar.zst
echo -ne 'y\ny\n' | sudo pacman -S bubblewrap-suid
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo -ne 'y\n' | ./install.sh -drs
#sed  -i "s/sudo .*/&\" root/;s/sudo /echo \-ne '1111\\\n' \|  su -c \"/" *.sh
rsync -axHAWXS /home/jason/jasolinux/files/ /
pacman -Qeqt > /home/jason/after.txt
exit
