#!/bin/bash

trap "\n echo exiting...; exit" SIGHUP SIGINT SIGTERM
paccache -r -k 1 >/dev/null 2>&1
paccache -r -k 1 -c /home/jason/jasorepo/ >/dev/null 2>&1
paccache -r -k 1 -c /home/jason/.packages/ 2>&1 >/dev/null

if [[ "$#" != "0" ]]; then
    echo "Importing packages..."
    pacman -Qqet >/home/jason/jasorepo/packages.x86_64

    for i in "$@"; do
        echo $i"iquotes"
        k=$(ls /var/cache/pacman/pkg/ | grep "$i" | sort | head -1)
        p=$(ls /home/jason/.packages | grep "$i" | sort | head -1)
        echo $k"kquotes"
        echo $p"pquotes"
        sed -i "s/$i//;/^$/d" /home/jason/jasorepo/packages.x86_64
        echo $i >>/home/jason/jasorepo/packages.x86_64
        echo "there"
        if [[ "$k" ]]; then
            rsync -avh "/var/cache/pacman/pkg/$k" /home/jason/jasorepo/.
            su -c "repo-add /home/jason/jasorepo/jasorepo.db.tar.zst /home/jason/jasorepo/$k" jason
            echo "/home/jason/jasorepo/$k"
            echo "/home/jason/jasorepo/$i"
            echo "Inside KKK"
        elif [[ "$p" ]]; then
            rsync -avh "/home/jason/.packages/$p" /home/jason/jasorepo/.
            su -c "repo-add /home/jason/jasorepo/jasorepo.db.tar.zst /home/jason/jasorepo/$p" jason
            echo "Inside PPP"
        else
            for j in $(pacman -Qetq); do
                m=$(ls /var/cache/pacman/pkg/ | grep "$j" | sort | head -1)
                rsync -avh "/var/cache/pacman/pkg/$m" /home/jason/jasorepo/.
                su -c "repo-add -n /home/jason/jasorepo/jasorepo.db.tar.zst /home/jason/jasorepo/$m" jason
                echo "Inside MMM"
            done
        fi

    done
    exit
fi
rm -v /home/jason/jasorepo/jasorepo.db.tar.zst.lck 2>&1 | grep -v "No such"
#rm -rf /home/jason/jasorepo/*.db
#rm -rf /home/jason/jasorepo/*.files
#rm -rf /home/jason/jasorepo/*.db.tar
#rm -rf /home/jason/jasorepo/*.files.tar

paccache -r -k 1 -c /home/jason/jasorepo/ 2>&1 >/dev/null
exit
