#!/bin/sh
mount -o remount,rw /
cd /recalbox/share/roms
if [ -e recalbox-package-ikemen-batch.7z ]; then
    rm recalbox-package-ikemen-batch.7z
fi

wget https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/recalbox-package-ikemen-batch.7z
7zr x -aoa -y recalbox-package-ikemen-batch.7z
rm recalbox-package-ikemen-batch.7z
echo "============================"
echo "Updating Ikemen SystemList..."
mv ikemen/systemlist.xml /recalbox/share/system/.emulationstation/

echo "1. Installing Ikemen-Go Engine..."
mv ikemen/Ikemen_GO_Linux_RG353P_Batch /usr/bin/
chmod a+x /usr/bin/Ikemen_GO_Linux_RG353P_Batch
cd default
Ikemen_GO_Linux_RG353P_Batch -install
