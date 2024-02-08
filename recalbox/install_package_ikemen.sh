#!/bin/sh
mount -o remount,rw /
wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-ikemen.7z
7zr x recalbox-package-ikemen.7z
mv ikemen/Ikemen_GO_Linux_RG353P /usr/bin/
chmod a+x /usr/bin/Ikemen_GO_Linux_RG353P
mv ikemen/systemlist.xml /recalbox/share/system/.emulationstation/
mv ikemen/ /recalbox/share/roms/
