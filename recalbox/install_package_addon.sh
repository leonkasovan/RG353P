#!/bin/sh

mount -o remount,rw /

cd /recalbox/share/roms
if [ -d /recalbox/share/roms/addon/filecommander ]; then
    rm -r /recalbox/share/roms/addon/filecommander
fi

if [ -e recalbox-package-addon.7z ]; then
    rm recalbox-package-addon.7z
fi

wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-addon.7z
7zr x -aoa -sdel recalbox-package-addon.7z
echo "============================"

echo "Updating Addon SystemList..."
mv addon/systemlist.xml /recalbox/share/system/.emulationstation/

echo "1. Installing File Manager..."
mv addon/DinguxCommander_SDL2 /usr/bin/
chmod a+x /usr/bin/DinguxCommander_SDL2

echo "2. Installing Terminal..."
mv addon/st /usr/bin/
chmod a+x /usr/bin/st

echo "3. Installing Joystick Tester..."
mv addon/sdl_joystick_arm64 /usr/bin/
chmod a+x /usr/bin/sdl_joystick_arm64

echo "4. Install SDL1.2 compatibility layer..."
mv addon/libSDL-1.2.so.1.2.69 /usr/lib/
cd /usr/lib/
rm libSDL.so
rm libSDL-1.2.so.0
ln -s libSDL-1.2.so.1.2.69 libSDL.so
ln -s libSDL-1.2.so.1.2.69 libSDL-1.2.so.0
