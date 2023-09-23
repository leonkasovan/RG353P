# rm -rf CMakeFiles
# rm -f CMakeCache
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
# PATH=${HOME}/sysroot/bin:${HOME}/sysroot/usr/bin PKG_CONFIG_SYSROOT_DIR=${HOME}/sysroot PKG_CONFIG_LIBDIR=${HOME}/sysroot/usr/lib/pkgconfig ${HOME}/sysroot/usr/bin/make VERBOSE=1 -j8
PATH=${HOME}/sysroot/bin:${HOME}/sysroot/usr/bin ${HOME}/sysroot/usr/bin/make VERBOSE=1 -j8
