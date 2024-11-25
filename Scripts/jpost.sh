#!/bin/bash


cd /home/jason/jasolinux/Scripts
echo -ne '1111\n1111\n1111\n1111\n' | ./install.sh -drs
#sed  -i "s/sudo .*/&\" root/;s/sudo /echo \-ne '1111\\\n' \|  su -c \"/" *.sh
echo -ne '1\n' | ./install.sh -drs
pacman -Qeqt > /home/jason/after.txt
exit
