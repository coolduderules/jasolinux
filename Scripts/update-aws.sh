#!/bin/bash
export jasorepo='/home/jason/jasorepo'

s3cmd sync --follow-symlinks --acl-public $jasorepo s3://jasorepo
rsync -aRvh /home/jason/.config "$jasorepo"/files
rsync -aRvh /home/jason/scripts "$jasorepo"/files
rsync -aRvh /home/jason/user_c* "$jasorepo"/files
rsync -aRvh /home/jason/.themes "$jasorepo"/files
rsync -aRvh /home/jason/.bash* "$jasorepo"/files
rsync -aRvh /home/jason/.zsh* "$jasorepo"/files
rsync -avh "$jasorepo"/files/etc/* /etc
for i in $(cat /home/jason/scripts/excludes.txt); do
    #m -i "/etc/$i"
    echo $i
done
#s3cmd sync --ignore-existing --follow-symlinks --acl-public s3://jasorepo/files/* /
