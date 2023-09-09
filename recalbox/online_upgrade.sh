# Script for upgrading Recalbox-9.1 Pulstar (by dhani.novan@gmail.com 2023/09/09)
# 1. Add scrape local (screenshot)
# 2. Fix event for custom script
# 3. Add lua support for scripting in ES Event
# 4. Fix icon no_image
# 5. Enable / Disable splash screen
# 6. Add log viewer
# 7. Simplify menu
# 8. 100% BIOS setup

mount -o remount,rw /

# Download BIOS
if [ ! -f "/recalbox/share/system/bios-recalbox-9.1.7z" ]; then
	echo "Downloading BIOS ..."
	wget --show-progress -N -O /recalbox/share/system/bios-recalbox-9.1.7z https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/bios-recalbox-9.1.7z
fi

# Download EmulationStation
if [ ! -f "/recalbox/share/system/emulationstation.7z" ]; then
	echo "Downloading EmulationStation ..."
	wget --show-progress -N -O /recalbox/share/system/emulationstation.7z https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/emulationstation.7z
fi

# Update BIOS
if [ -f "/recalbox/share/system/bios-recalbox-9.1.7z" ]; then
	echo "Updating BIOS ..."
	7zr x -aoa -o/recalbox/share /recalbox/share/system/bios-recalbox-9.1.7z
	rm /recalbox/share/system/bios-recalbox-9.1.7z
fi

# Upgrade EmulationStation
if [ -f "/recalbox/share/system/emulationstation.7z" ]; then
	echo "Upgrading EmulationStation ..."
	es stop
	sleep 3
	7zr x -aoa -o/usr/bin /recalbox/share/system/emulationstation.7z
	rm /recalbox/share/system/emulationstation.7z
	chmod a+x /usr/bin/emulationstation
	sleep 1
	es start
fi
if [ -f "/recalbox/share/system/emulationstation" ]; then
	echo "Upgrading EmulationStation ..."
	es stop
	sleep 3
	mv /recalbox/share/system/emulationstation /usr/bin/emulationstation
	chmod a+x /usr/bin/emulationstation
	sleep 1
	es start
fi

