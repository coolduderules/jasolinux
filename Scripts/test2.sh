#!/bin/bash

trap "\n echo exiting...; exit" SIGHUP SIGINT SIGTERM
k=`find /var/cache/pacman/pkg/ | grep -f /home/jason/packages.x86_64`
for i in "/home/jason/packages.x86_64"; do

rsync -avh "/var/cache/pacman/pkg/"$i.pkg.tar.zst /home/jason/jasorepo/.
rsync -avh "/var/cache/pacman/pkg/"$i"-*.pkg.tar.zst"
rm -rf /home/jason/jasorepo/*.sig
#repo-add /home/jason/jasorepo/jasorepo.db.tar.zst $i"-*.pkg.tar.zst"
chown -R jason /home/jason/jasorepo
chmod -R 777 /home/jason/jasorepo
sleep 3

done

echo "$k"
echo "$k"
exit
