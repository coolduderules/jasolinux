#!/usr/bin/bash

# This adds the necessary library files for arch-chroot to work.

for i in $(cat /home/jason/scripts/transfer/chrootlist.txt)
do
    rsync -aRh /usr$i* /mnt &> /dev/null
    rsync -aRh $i* /mnt &> /dev/null
done

# Now let's add the passwd file for /useradd to be able to make a user, along with a group file conveniently already populated with base groups for our user

cat > /mnt/etc/passwd << "EOF"
root:x:0:0:root:/root:/usr/bin/bash
EOF
cat > /mnt/etc/group << "EOF"
root:x:0:
bin:x:1:
jason:x:1000:
EOF
