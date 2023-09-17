#!/bin/bash
aarch64-linux-gnu-strip -s emulationstation
7zr a emulationstation.7z emulationstation
sftp root@192.168.1.7 <<EOF
put emulationstation.7z
EOF
