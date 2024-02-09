#!/bin/sh

mount -o remount,rw /
wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-love-11.3.7z
7zr x recalbox-package-love-11.3.7z
mv ArnesBreakout.love /recalbox/share/roms/love/
mv systemlist.xml /recalbox/share/system/.emulationstation/
mv libluajit-5.1.so /usr/lib/
mv love-11.3 /usr/bin/
chmod a+x /usr/bin/love-11.3
cd /usr/bin/
ln -s love-11.3 love
