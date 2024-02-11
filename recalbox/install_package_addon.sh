#!/bin/sh

mount -o remount,rw /
https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-addon.7z
7zr x recalbox-package-addon.7z
mv addon/DinguxCommander_SDL2 /usr/bin/
chmod a+x /usr/bin/DinguxCommander_SDL2
mv addon/st /usr/bin/
chmod a+x /usr/bin/st
mv addon/File\ Commander.sh /recalbox/share/roms/addon/
mv addon/Terminal.sh /recalbox/share/roms/addon/
mv addon/filecommander /recalbox/share/roms/addon/
mv addon/simpleterminal /recalbox/share/roms/addon/
mv systemlist.xml /recalbox/share/system/.emulationstation/
