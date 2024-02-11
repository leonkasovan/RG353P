#!/bin/sh

mount -o remount,rw /
wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-love.7z
7zr x recalbox-package-love.7z
mv love/ArnesBreakout.love /recalbox/share/roms/love/
mv love/systemlist.xml /recalbox/share/system/.emulationstation/
mv love/libluajit-5.1.so /usr/lib/
mv love-11.3 /usr/bin/
chmod a+x /usr/bin/love-11.3
mv love/liblove-11.5.so /usr/lib/
mv love-11.5 /usr/bin/
chmod a+x /usr/bin/love-11.5
cd /usr/bin/
ln -s love-11.5 love
