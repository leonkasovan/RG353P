/etc/init.d/S31emulationstation stop
anbernic-settings-set system.es.custom 1
anbernic-settings-set rom_downloader.db.path /userdata/roms/bin/es/
anbernic-settings-set port_downloader.db.path /userdata/roms/bin/es/portmaster.db
anbernic-settings-set rom_downloader.last_search_name prince
anbernic-settings-set run.external.path /userdata/roms/bin/
anbernic-settings-set run.filemanager.path /userdata/roms/bin/EnhancedFileManager
cd
ln -s anbernic.conf batocera.conf 
cd /usr/bin
ln -s	anbernic-audio	batocera-audio
ln -s	anbernic-autologin	batocera-autologin
ln -s	anbernic-bluetooth	batocera-bluetooth
ln -s	anbernic-bluetooth-agent	batocera-bluetooth-agent
ln -s	anbernic-brightness	batocera-brightness
ln -s	anbernic-config	batocera-config
ln -s	anbernic-cores	batocera-cores
ln -s	anbernic-create-collection	batocera-create-collection
ln -s	anbernic-drminfo	batocera-drminfo
ln -s	anbernic-encode	batocera-encode
ln -s	anbernic-es-swissknife	batocera-es-swissknife
ln -s	anbernic-es-thebezelproject	batocera-es-thebezelproject
ln -s	anbernic-es-theme	batocera-es-theme
ln -s	anbernic-evmapy	batocera-evmapy
ln -s	anbernic-format	batocera-format
ln -s	anbernic-gamepad	batocera-gamepad
ln -s	anbernic-gamepad.sh	batocera-gamepad.sh
ln -s	anbernic-hybrid-nvidia	batocera-hybrid-nvidia
ln -s	anbernic-info	batocera-info
ln -s	anbernic-install	batocera-install
ln -s	anbernic-kodi	batocera-kodi
ln -s	anbernic-kodilauncher	batocera-kodilauncher
ln -s	anbernic-makepkg	batocera-makepkg
ln -s	anbernic-moonlight	batocera-moonlight
ln -s	anbernic-mount	batocera-mount
ln -s	anbernic-overclock	batocera-overclock
ln -s	anbernic-pacman-batoexec	batocera-pacman-batoexec
ln -s	anbernic-padsinfo	batocera-padsinfo
ln -s	anbernic-part	batocera-part
ln -s	anbernic-poweroff	batocera-poweroff
ln -s	anbernic-pygame	batocera-pygame
ln -s	anbernic-resolution	batocera-resolution
ln -s	anbernic-rockchip-suspend	batocera-rockchip-suspend
ln -s	anbernic-save-overlay	batocera-save-overlay
ln -s	anbernic-screenshot	batocera-screenshot
ln -s	anbernic-settings-get	batocera-settings-get
ln -s	anbernic-settings-set	batocera-settings-set
ln -s	anbernic-sleep	batocera-sleep
ln -s	anbernic-store	batocera-store
ln -s	anbernic-support	batocera-support
ln -s	anbernic-sync	batocera-sync
ln -s	anbernic-systems	batocera-systems
ln -s	anbernic-upgrade	batocera-upgrade
ln -s	anbernic-usbmount	batocera-usbmount
ln -s	anbernic-wifi	batocera-wifi
ln -s	anbernic-x360box	batocera-x360box
ln -s	anbernic-x360box.sh	batocera-x360box.sh

#if [ ! -d "/userdata/roms/bin/es" ]; then
  mkdir -p /userdata/roms/bin/es
#fi

#shopt -s nullglob
#csv_files=(/userdata/roms/bin/es/*.csv)
#if [ ${#csv_files[@]} -gt 0 ]; then
#  echo "CSV files exist in the directory."
#else
  cd /userdata/roms/bin/es/
  echo "Downloading roms downloader database..."
  wget -O db.zip https://github.com/leonkasovan/batocera-emulationstation/releases/download/v202307/db.zip
  unzip -o db.zip
#fi

#if [ ! -f "/userdata/roms/bin/emulationstation" ]; then
  cd /userdata/roms/bin/
  wget --show-progress -N https://github.com/leonkasovan/batocera-emulationstation/releases/download/v202307/emulationstation.7z
  7zr x -y emulationstation.7z
  rm emulationstation.7z
  #wget --show-progress https://github.com/leonkasovan/batocera-emulationstation/releases/download/v202307/emulationstation.zip
  #unzip -o emulationstation.zip
  wget --show-progress -N https://github.com/leonkasovan/351Files/releases/download/v202307/FileManager.7z
  7zr x -y FileManager.7z
  rm FileManager.7z
#fi
wget -O /etc/init.d/S31emulationstation https://raw.githubusercontent.com/leonkasovan/RG353P/main/S31emulationstation.sh

anbernic-save-overlay 100
#anbernic-poweroff
#reboot
