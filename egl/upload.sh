#!/bin/bash

sftp root@192.168.1.11 <<EOF
cd /userdata/roms/bin
put test_egl
EOF
