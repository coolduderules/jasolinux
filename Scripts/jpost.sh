#!/bin/bash


cd /home/jason/jasolinux/scripts
rsync --info=progress2 /home/jason/scripts/install.sh /home/jason/HyDE/Scripts/
#sed  -i "s/sudo .*/&\" root/;s/sudo /echo \-ne '1111\\\n' \|  su -c \"/" *.sh
echo -ne '1\n' | ./install.sh -drs
pacman -Qeqt > /home/jason/after.txt
exit
