#!/bin/sh

mount -o remount,rw /

cd /recalbox/share/roms
if [ -d /recalbox/share/roms/addon/filecommander ]; then
    rm -r /recalbox/share/roms/addon/filecommander
fi

wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-addon.7z
7zr x recalbox-package-addon.7z

echo "Installing File Manager..."
mv addon/DinguxCommander_SDL2 /usr/bin/
chmod a+x /usr/bin/DinguxCommander_SDL2

echo "Installing Terminal..."
mv addon/st /usr/bin/
chmod a+x /usr/bin/st

echo "Install SDL1.2 compatibility layer"
mv addon/libSDL-1.2.so.1.2.69 /usr/lib/
cd /usr/lib/
rm libSDL.so
rm libSDL-1.2.so.0
ln -s libSDL-1.2.so.1.2.69 libSDL.so
ln -s libSDL-1.2.so.1.2.69 libSDL-1.2.so.0

echo "Updating Addon SystemList..."
mv addon/systemlist.xml /recalbox/share/system/.emulationstation/
