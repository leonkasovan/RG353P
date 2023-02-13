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
EOF
cp /etc/triggerhappy/triggers.d/multimedia_keys.conf /etc/triggerhappy/triggers.d/multimedia_keys_disabled.conf
anbernic-save-overlay 100
reboot
