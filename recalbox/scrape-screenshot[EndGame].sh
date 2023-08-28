#!/bin/bash
# /bin/bash scrape-screenshot.sh 1 endgame 3 4 5 "/recalbox/share/roms/megadrive/Doom Troopers (USA).zip"

# logfile="/recalbox/share/userscripts/script.log"
# echo "Args: $@"  >> $logfile
# echo "Arg 1: $1"  >> $logfile
# echo "Arg 2: $2"  >> $logfile
# echo "Arg 3: $3"  >> $logfile
# echo "Arg 4: $4"  >> $logfile
# echo "Arg 5: $5"  >> $logfile
# echo "Arg 6: $6"  >> $logfile

directory="/recalbox/share/screenshots"
rom_fullpath=$6
rom_extension="${rom_fullpath##*.}"
rom_filename=$(basename "$rom_fullpath")
rom_title=$(basename "$rom_fullpath" ".$rom_extension")
rom_directory=$(dirname "$rom_fullpath")

# Iterate through files in the directory
for file in "$directory"/*; do
	if [[ -f "$file" ]]; then # Check if it's a regular file
		# echo "File: $file" 
		if [[ $file == *"$rom_title"* ]]; then # Compare the filename with the specific string
			source="$file"
			target="$rom_directory/media/images/$rom_title.png"
		fi
	fi
done
mkdir -p "$rom_directory/media/images"
cp "$source" "$target"
sed -i.bak -e /"media\/images\/$rom_title"/d "$rom_directory/gamelist.xml"	# delete existing image value
sed -i.bak -e "/$rom_filename/i\		<image>media/images/$rom_title.png</image>" "$rom_directory/gamelist.xml" # insert new path for image value
touch "$rom_directory/gamelist.xml"
