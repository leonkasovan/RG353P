# Script for updating BIOS (100%) in Recalbox (by dhani.novan@gmail.com 2023/09/09)

mount -o remount,rw /

# Download BIOS
if [ ! -f "/recalbox/share/system/bios-recalbox-9.1.7z" ]; then
	echo "Downloading BIOS ..."
	wget --show-progress -O /recalbox/share/system/bios-recalbox-9.1.7z https://github.com/leonkasovan/RG353P/releases/download/recalbox-9.1/bios-recalbox-9.1.7z
fi

# Update BIOS
if [ -f "/recalbox/share/system/bios-recalbox-9.1.7z" ]; then
	echo "Updating BIOS ..."
	7zr x -aoa -o/recalbox/share /recalbox/share/system/bios-recalbox-9.1.7z
	rm /recalbox/share/system/bios-recalbox-9.1.7z
fi

mount -o remount,ro /
echo "Done."
