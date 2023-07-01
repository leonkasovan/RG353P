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
  rm emulationstation.zip
fi

cat > /etc/init.d/S31emulationstation <<EOF
#!/bin/sh
BOOTCONF="/boot/anbernic-boot.conf"

# intel-iris-driver
irisdriver="$(/usr/bin/anbernic-settings-get -f "$BOOTCONF" intel-i965-driver)"
if test ! -z "${irisdriver}" -a "${irisdriver}" = true; then
	# Force use i965 driver through global environment variable
	export MESA_LOADER_DRIVER_OVERRIDE=i965
fi

case "$1" in
	start)
		enabled="$(/usr/bin/anbernic-settings-get system.es.atstartup)"
		secured="$(/usr/bin/anbernic-settings-get system.es.maxresolution)"
		bootresolution="$(/usr/bin/anbernic-settings-get -f "$BOOTCONF" es.maxresolution)"
		custom_es="$(/usr/bin/anbernic-settings-get system.es.custom)"
		test ! -z "${bootresolution}" && secured="${bootresolution}"
		if [ "$enabled" != "0" ];then
			if test "${secured}" = 0 -o -z "${secured}"
			then
			  anbernic-resolution minTomaxResolution-secure
			else
			  anbernic-resolution minTomaxResolution "${secured}"
			fi
			settings_lang="$(/usr/bin/anbernic-settings-get system.language)"
			display_rotate="$(/usr/bin/anbernic-settings-get display.rotate)"

			EXTRA_OPTS=
			test -n "${display_rotate}" && EXTRA_OPTS="--screenrotate ${display_rotate}"

			cd /userdata # es need a PWD
			HOME=/userdata/system LANG="${settings_lang}.UTF-8" SDL_NOMOUSE=1 /usr/bin/emulationstation --no-splash ${EXTRA_OPTS} &
			if [ "$custom_es" != "0" ];then
				HOME=/userdata/system LANG="${settings_lang}.UTF-8" SDL_NOMOUSE=1 /userdata/roms/bin/emulationstation --no-splash ${EXTRA_OPTS} &
			else
				HOME=/userdata/system LANG="${settings_lang}.UTF-8" SDL_NOMOUSE=1 /usr/bin/emulationstation --no-splash ${EXTRA_OPTS} &
			fi
		fi
		;;

	stop)
		killall emulationstation
		if [ $? -eq 0 ]; then
			sleep 20 &
			watchdog=$!
			while ! [ -z $(pidof emulationstation) ]; do
				sleep 0.25
				$(kill -0 $watchdog) || exit
			done
			kill -9 $watchdog
		fi
		;;

	restart|reload)
		"$0" stop
		"$0" start
		;;
	
	*)
		echo "Usage: $0 {start|stop|restart}"
		exit 1
esac
exit $?
EOF

anbernic-save-overlay 100
reboot
