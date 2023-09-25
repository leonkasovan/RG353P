#DEBIAN:
#cp -a /usr/lib/x86_64-linux-gnu/libmpc.so* /mnt/d/
#cp -a /usr/lib/x86_64-linux-gnu/libisl.so* /mnt/d/
#cp 7zr 
#cp 7zr 
#cp pkg-config

#UBUNTU:
#sudo cp -a /mnt/d/libmpc.so* /usr/lib/x86_64-linux-gnu/
#sudo cp -a /mnt/d/libisl.so* /usr/lib/x86_64-linux-gnu/

cd /home/ark/recalbox-rpi4_64/output/host/aarch64-buildroot-linux-gnu/sysroot/
mkdir -p usr/bin2 bin2 usr/libexec
cp -a ../../share/cmake-3.22 usr/share
cp -a ../include/ .
cp -a ../../../host/bin/pkg* bin2
cp -a ../../../host/bin/busybox bin2
cp -a ../../lib/gcc usr/lib
cp -a ../../libexec/gcc usr/libexec
cp -a ../bin/* bin2
cp -a ../../bin/aarch64-* usr/bin2
cp -a ../../bin/toolchain-wrapper usr/bin2
cp -a ../../bin/cmake usr/bin2
cp -a /usr/bin/dirname usr/bin2
cp -a /usr/bin/make usr/bin2
7zr a sysroot_for_dev.7z usr/libexec/gcc usr/include/ usr/lib/ usr/bin2/ usr/share/cmake-3.22 bin2/ lib/ include/
rm -rf usr/share/cmake-3.22
rm -rf include
rm -rf usr/lib/gcc
rm -rf usr/libexec
rm -rf usr/bin2
rm -rf bin2
mv sysroot_for_dev.7z ../../../../
