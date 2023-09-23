cd /home/ark/recalbox-rpi4_64/output/host/aarch64-buildroot-linux-gnu/sysroot/
mkdir -p usr/bin2 bin2 usr/libexec
cp -a ../../../host/bin/pkg* bin2
cp -a ../../../host/bin/busybox bin2
cp -a ../../lib/gcc usr/lib
cp -a ../../libexec/gcc usr/libexec
cp -a ../bin/* bin2
cp -a ../../bin/aarch64-* usr/bin2
cp -a ../../bin/toolchain-wrapper usr/bin2
cp -a ../../bin/cmake usr/bin2
cp -a /usr/bin/dirname usr/bin2
ln -s lib lib64
cd usr
ln -s lib lib64
cd ..

7zr a sysroot_for_dev.7z usr/libexec usr/include/ usr/lib/ usr/bin2/ bin2/ lib/

rm -rf usr/lib/gcc
rm -rf usr/libexec
rm -rf usr/bin2/dirname
rm -rf usr/bin2
rm -rf bin2
mv sysroot_for_dev.7z ../../../../
