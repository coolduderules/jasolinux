PKGBUILD=/home/jason/jasorepo/jaso-base/PKGBUILD

sed -i '/depends=/d' $PKGBUILD
sed -i '/^$/d' $PKGBUILD #Delete all empty lines

printf '\n' >> $PKGBUILD #Avoid that the new "depends" string is placed on an existing row
printf 'depends=( ' >> $PKGBUILD
printf "'%s' " $(pacman -Qqet | sort -u) >> $PKGBUILD
printf ')\n' >> $PKGBUILD


sed -i -r 's/pkgrel=([0-9]+)/echo "pkgrel=$((\1+1))"/ge' $PKGBUILD
