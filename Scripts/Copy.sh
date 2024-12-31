#!/usr/bin/bash

#NAMES=`yay -Qe`
#yay -Qe | sed 's/ /-/' 2>&1| sed 's/$/-x86_64.pkg.tar.zst/' | xargs -I {} rsync
#replace |

for i in $(pacman -Qeq | grep -v .sig)
do
    j=`ls /var/cache/pacman/pkg/ | grep $i | head -1`
    if [[ $j != $i.pkg.tar.zst ]]
    then
        echo 'This turns  '$j
        echo 'Into this   '$i.pkg.tar.zst
        echo $USER
        #echo 'mv -fv $(echo $j) $(echo $i.pkg.tar.zst)'
        read var
            if [[ -n $var ]]
            then
                mv -f /var/cache/pacman/pkg/$j /var/cache/pacman/pkg/$i.pkg.tar.zst &> xargs echo
                continue
            fi
    fi
            #rename * $i /var/cache/pkg/


done
