#!/bin/bash

repo-add /home/jason/jasorepo/jasorepo.db.tar.zst
repo-add /home/jason/jasorepo/jasorepo.db.tar.zst /home/jason/jasorepo/*.pkg.tar.zst
sudo pacman -Syy
sudo pacman -Fyy
cd /home/jason
pacman -Qeqt > before.txt
echo -ne '1\n1\n1\ny\ny\n' | sudo pacman -S pipewire-jack
git clone --depth 1 https://github.com/prasanthrangan/hyprdots /home/jason/HyDE
cd /home/jason/HyDE/Scripts
rsync --info=progress2 /home/jason/scripts/install.sh /home/jason/HyDE/Scripts/
#sed  -i "s/sudo .*/&\" root/;s/sudo /echo \-ne '1111\\\n' \|  su -c \"/" *.sh
echo -ne '1\n' | ./install.sh -drs
pacman -Qeqt > /home/jason/after.txt
exit
