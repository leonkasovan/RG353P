#!/bin/sh

mount -o remount,rw /
cd /recalbox/share/roms
if [ -e recalbox-package-love.7z ]; then
    rm recalbox-package-love.7z
fi
wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-love.7z
7zr x -aoa recalbox-package-love.7z
rm recalbox-package-love.7z
echo "============================"
echo "Updating Love SystemList..."
mv love/systemlist.xml /recalbox/share/system/.emulationstation/

echo "1. Installing Love 11.3 ..."
mv love/libluajit-5.1.so /usr/lib/
mv love/love-11.3 /usr/bin/
chmod a+x /usr/bin/love-11.3

echo "2. Installing Love 11.5 (set as default: love) ..."
mv love/liblove-11.5.so /usr/lib/
mv love/love-11.5 /usr/bin/
chmod a+x /usr/bin/love-11.5
cd /usr/bin/
ln -s love-11.5 love
