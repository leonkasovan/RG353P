rm -rf CMakeFiles
rm -f CMakeCache
PKG_CONFIG_SYSROOT_DIR=/home/ubuntu/sysroot PKG_CONFIG_LIBDIR=/home/ubuntu/sysroot/usr/lib/pkgconfig cmake . \
-DCMAKE_COLOR_MAKEFILE=ON \
-DCMAKE_AR="/usr/bin/aarch64-linux-gnu-gcc-ar" \
-DCMAKE_C_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>" \
-DCMAKE_C_ARCHIVE_FINISH=true \
-DCMAKE_CXX_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>" \
-DCMAKE_CXX_ARCHIVE_FINISH=true \
-DCMAKE_C_COMPILER="/usr/bin/aarch64-linux-gnu-gcc" \
-DCMAKE_CXX_COMPILER="/usr/bin/aarch64-linux-gnu-g++" \
-DCMAKE_LINKER="/usr/bin/aarch64-linux-gnu-ld" \
-DCMAKE_SYSROOT="/home/ubuntu/sysroot" \
-DCMAKE_INCLUDE_DIR="/home/ubuntu/sysroot/usr/include" \
-DCMAKE_LIBRARY_PATH="/home/ubuntu/sysroot/usr/lib" \
-DCMAKE_C_FLAGS="  -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"     -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"    -O3 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections  -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections " \
-DCMAKE_CXX_FLAGS="  -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"     -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"    -O3 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections  -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections " \
-DCMAKE_LINKER_EXE_FLAGS=" -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"     -mabi="lp64" -mabi="lp64" -mcpu="cortex-a72" -mcpu="cortex-a72"    -O3 -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections  -fdata-sections -ffunction-sections -Wl,--gc-sections -fdata-sections -ffunction-sections -Wl,--gc-sections " \
-DOPTION_RECALBOX_PRODUCTION_BUILD=true \
-DBUILD_SHARED_LIBS=ON \
-DUSE_KMSDRM=ON
