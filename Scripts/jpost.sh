#!/bin/bash

cd /home/jason
git clone https://github.com/coolduderules/jasolinux.git
cd /home/jason/jasolinux/Scripts
sudo sysctl kernel.unprivileged_userns_clone=1
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo -ne 'y\n' | ./install.sh -drs
#sed  -i "s/sudo .*/&\" root/;s/sudo /echo \-ne '1111\\\n' \|  su -c \"/" *.sh
rsync -axHAWXS /home/jason/jasolinux/Configs/* /home/jason/
pacman -Qeqt > /home/jason/after.txt
exit
