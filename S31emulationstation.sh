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

