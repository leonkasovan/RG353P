/etc/init.d/S31emulationstation stop
anbernic-settings-set system.es.custom 1
anbernic-settings-set rom_downloader.db.path /userdata/roms/bin/es/
anbernic-settings-set port_downloader.db.path /userdata/roms/bin/es/portmaster.db
anbernic-settings-set port_downloader.new.db.path /userdata/roms/bin/es/new-portmaster.db
anbernic-settings-set rom_downloader.last_search_name prince
anbernic-settings-set run.external.path /userdata/roms/bin/
anbernic-settings-set run.filemanager.path /userdata/roms/bin/EnhancedFileManager
cd
ln -s anbernic.conf batocera.conf
cd /usr/share
ln -s anbernic batocera
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
  wget -N -O db.zip https://github.com/leonkasovan/batocera-emulationstation/releases/download/v202307/db.zip
  unzip -o db.zip
#fi

#if [ ! -f "/userdata/roms/bin/emulationstation" ]; then
  cd /userdata/roms/bin/
  wget --show-progress -N https://github.com/leonkasovan/batocera-emulationstation/releases/download/v202307/emulationstation.7z
  7zr x -y emulationstation.7z
  rm emulationstation.7z
  wget --show-progress https://github.com/leonkasovan/luaxx/releases/download/v5.1.5.80/luaxx-linux-arm64.7z
  7zr x -y luaxx-linux-arm64.7z
  rm luaxx-linux-arm64.7z
  if [ -f "/usr/bin/luaxx" ]; then
    rm /usr/bin/luaxx
  fi
  ln -sf /userdata/roms/bin/luaxx /usr/bin/luaxx
  wget --show-progress -N https://github.com/leonkasovan/351Files/releases/download/v202307/FileManager.7z
  7zr x -y FileManager.7z
  mv magic /etc/magic
  mv magic.mime /etc/magic.mime
  mv file /usr/bin/file
  mv libmagic.so.1 /usr/lib/libmagic.so.1
  mkdir -p /usr/share/misc/
  mv magic.mgc /usr/share/misc/magic.mgc
  rm FileManager.7z
#fi
wget -N -O /userdata/roms/bin/es/gen_db_from_port_master.lua https://raw.githubusercontent.com/leonkasovan/batocera-emulationstation/master/gen_db_from_port_master.lua
wget -N -O /etc/init.d/S31emulationstation https://raw.githubusercontent.com/leonkasovan/RG353P/main/S31emulationstation.sh
wget -N -O /usr/bin/anbernic-es-theme https://raw.githubusercontent.com/leonkasovan/RG353P/main/anbernic-es-theme
wget -N -O /usr/bin/anbernic-es-thebezelproject https://raw.githubusercontent.com/leonkasovan/RG353P/main/anbernic-es-thebezelproject
chmod a+x /usr/bin/anbernic-es-theme
chmod a+x /usr/bin/anbernic-es-thebezelproject
cd /userdata/system/pacman/db/sync
ln -s anbernic.db batocera.db
cat > /etc/pacman.conf <<EOF
[options]
RootDir           = /
DBPath            = /userdata/system/pacman/db/
CacheDir          = /userdata/system/pacman/pkg/
HookDir           = /etc/pacman/hooks/
LogFile           = /userdata/system/pacman/pacman.log
Architecture      = aarch64
SigLevel = Never
CheckSpace
DisableDownloadTimeout

[batocera]
Server            = https://store.batocera.org/

Include           = /userdata/system/pacman/pacman.conf
EOF

cat > /etc/profile.d/terminal_setup.sh <<EOF
# Set xterm as terminal enviroment
if [ "\$(tty)" = "/dev/tty3" ]; then
TERM=linux  #login from device
else
TERM=xterm  #login via ssh
fi

# Add ANBERNIC logo and some alias, sourcing of $HOME/.bashrc can be added to $HOME/.profile
echo '
    _          _                     _
   / \   _ __ | |__   ___ _ __ _ __ (_) ___
  / _ \ | |_ \| |_ \ / _ \  __|  _ \| |/ __|
 / ___ \| | | | |_) |  __/ |  | | | | | (__
/_/   \_\_| |_|_.__/ \___|_|  |_| |_|_|\___|
                   RK3566
'
echo
echo "-- type 'anbernic-save-overlay' to save system files --"
echo "-- type 'anbernic-settings-set system.es.custom 0' to launch default emulationstation at boot"
echo
anbernic-info 2>/dev/null
echo "OS version: $(cat /usr/share/anbernic/anbernic.version)"
echo

# ---- ALIAS VALUES ----
alias mc='mc -x'
alias ls='ls -l'
EOF

cat > /etc/triggerhappy/triggers.d/multimedia_keys.conf <<EOF
KEY_VOLUMEDOWN+BTN_MODE   1   anbernic-brightness - 5
KEY_VOLUMEDOWN+BTN_MODE   2   anbernic-brightness - 5
KEY_VOLUMEUP+BTN_MODE   1   anbernic-brightness + 5
KEY_VOLUMEUP+BTN_MODE   2   anbernic-brightness + 5
KEY_VOLUMEUP	1		/usr/bin/amixer set Master 1%+ && amixer sget Master  | grep 'Front Left:'  |  awk -F '['  '{ print $2 }' |  awk -F '%'  '{ print $1 }'  > /sys/bus/platform/devices/singleadc-joypad/vol
KEY_VOLUMEUP	2		/usr/bin/amixer set Master 1%+ && amixer sget Master  | grep 'Front Left:'  |  awk -F '['  '{ print $2 }' |  awk -F '%'  '{ print $1 }'  > /sys/bus/platform/devices/singleadc-joypad/vol
KEY_VOLUMEDOWN	1		/usr/bin/amixer set Master 1%- && amixer sget Master  | grep 'Front Left:'  |  awk -F '['  '{ print $2 }' |  awk -F '%'  '{ print $1 }'  > /sys/bus/platform/devices/singleadc-joypad/vol
KEY_VOLUMEDOWN	2		/usr/bin/amixer set Master 1%- && amixer sget Master  | grep 'Front Left:'  |  awk -F '['  '{ print $2 }' |  awk -F '%'  '{ print $1 }'  > /sys/bus/platform/devices/singleadc-joypad/vol
KEY_POWER       0               /usr/bin/anbernic-sleep
KEY_POWER       2               /usr/bin/anbernic-poweroff
SW_HEADPHONE_INSERT 1           [[ "$(cat /sys/class/drm/card0-HDMI-A-1/status)" != "connected" ]] && [[ "$(cat /sys/bus/platform/devices/singleadc-joypad/hw_info)" == "2" ]] && anbernic-audio set HP
SW_HEADPHONE_INSERT 0           [[ "$(cat /sys/class/drm/card0-HDMI-A-1/status)" != "connected" ]] && [[ "$(cat /sys/bus/platform/devices/singleadc-joypad/hw_info)" == "2" ]] && anbernic-audio set SPK
BTN_MODE+BTN_THUMBL    1   /etc/init.d/S31emulationstation stop
BTN_MODE+BTN_THUMBR    1   /etc/init.d/S31emulationstation start
BTN_MODE+KEY_POWER    1   anbernic-screenshot
EOF
cp /etc/triggerhappy/triggers.d/multimedia_keys.conf /etc/triggerhappy/triggers.d/multimedia_keys_disabled.conf

anbernic-save-overlay 100
#anbernic-poweroff
reboot
