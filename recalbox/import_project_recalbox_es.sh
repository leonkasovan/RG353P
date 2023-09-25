cd ~
7zr x recalbox-emulationstation-project.7z
rm recalbox-emulationstation-project.7z
cd projects/frontend

cat > build.sh <<EOF
#!/bin/bash
PATH=${HOME}/sysroot/bin:${HOME}/sysroot/usr/bin PKG_CONFIG_SYSROOT_DIR=${HOME}/sysroot PKG_CONFIG_LIBDIR=${HOME}/sysroot/usr/lib/pkgconfig ${HOME}/sysroot/usr/bin/cmake . \
-DCMAKE_COLOR_MAKEFILE=ON \
-DCMAKE_C_COMPILER="${HOME}/sysroot/usr/bin/aarch64-buildroot-linux-gnu-gcc" \
-DCMAKE_CXX_COMPILER="${HOME}/sysroot/usr/bin/aarch64-buildroot-linux-gnu-g++" \
-DCMAKE_LINKER="${HOME}/sysroot/usr/bin/aarch64-buildroot-linux-gnu-ld" \
-DCMAKE_SYSROOT="${HOME}/sysroot" \
-DCMAKE_INCLUDE_DIR="${HOME}/sysroot/usr/include" \
-DCMAKE_LIBRARY_PATH="${HOME}/sysroot/usr/lib" \
-DCMAKE_C_FLAGS=" -I${HOME}/sysroot/usr/include -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72" -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"    -O3 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections  -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections " \
-DCMAKE_CXX_FLAGS=" -I${HOME}/sysroot/include/c++/11.4.0/aarch64-buildroot-linux-gnu -I${HOME}/sysroot/include/c++/11.4.0 -I${HOME}/sysroot/include/c++/11.4.0/backward -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"     -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"    -O3 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections  -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections " \
-DCMAKE_LINKER_EXE_FLAGS=" -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72" -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"    -O3 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections  -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections " \
-DOPTION_RECALBOX_PRODUCTION_BUILD=true \
-DBUILD_SHARED_LIBS=ON \
-DUSE_KMSDRM=ON
PATH=${HOME}/sysroot/bin:${HOME}/sysroot/usr/bin ${HOME}/sysroot/usr/bin/make -j8
EOF

cat > upload.sh <<EOF
#!/bin/bash
${HOME}/sysroot/usr/bin/aarch64-buildroot-linux-gnu-strip -s emulationstation
7zr a emulationstation.7z emulationstation
sftp root@192.168.1.7 <<END
put emulationstation.7z
END
rm emulationstation.7z
rm emulationstation
EOF

chmod a+x upload.sh
chmod a+x build.sh
