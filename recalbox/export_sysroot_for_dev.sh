cd /home/ark/recalbox-rpi4_64/output/host/aarch64-buildroot-linux-gnu/sysroot/
7zr a sysroot_for_dev.7z usr/include/ usr/lib/ ../../bin/aarch64-* ../../bin/toolchain-wrapper
mv sysroot_for_dev.7z ../../../../
