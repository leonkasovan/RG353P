# Script for upgrading Recalbox-9.1 Pulstar (by dhani.novan@gmail.com 2023/09/09)
# 1. Add scrape local (screenshot)
# 2. Fix event for custom script
# 3. Add lua support for scripting in ES Event
# 4. Fix icon no_image
# 5. Enable / Disable splash screen
# 6. Add log viewer
# 7. Simplify menu

es stop
sleep 3
mount -o remount,rw /
sleep 1

if [ -f "/recalbox/share/system/emulationstation" ]; then
  wget https://somewhere.com/emulationstation.7z
  7zr x -y emulationstation.7z
fi
mv emulationstation /usr/bin/emulationstation
chmod a+x /usr/bin/emulationstation

sleep 1
es start
