#!/bin/sh
mount -o remount,rw /
cd /recalbox/share/roms
if [ -e recalbox-package-ikemen.7z ]; then
    rm recalbox-package-ikemen.7z
fi

wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-ikemen.7z
7zr x recalbox-package-ikemen.7z
rm recalbox-package-ikemen.7z
echo "============================"
echo "Updating Ikemen SystemList..."
mv ikemen/systemlist.xml /recalbox/share/system/.emulationstation/

echo "1. Installing Ikemen-Go Engine..."
mv ikemen/Ikemen_GO_Linux_RG353P /usr/bin/
chmod a+x /usr/bin/Ikemen_GO_Linux_RG353P

