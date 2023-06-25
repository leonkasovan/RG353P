#!/bin/bash
sftp root@192.168.0.105 <<EOF
cd /userdata/roms/bin
put go-sdl-joystick
EOF