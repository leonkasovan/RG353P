/etc/init.d/S31emulationstation stop
anbernic-settings-set system.es.custom 1
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

if [ ! -f "/userdata/roms/bin/emulationstation" ]; then
  cd /userdata/roms/bin/
  wget --show-progress -O emulationstation.zip https://github.com/leonkasovan/batocera-emulationstation/releases/download/v202307/emulationstation.zip
  unzip emulationstation.zip
fi

wget -O /etc/init.d/S31emulationstation https://raw.githubusercontent.com/leonkasovan/RG353P/main/S31emulationstation.sh

anbernic-save-overlay 100
#anbernic-poweroff
reboot
