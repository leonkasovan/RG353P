#!/bin/bash

cd ~
rm -rf sysroot
mkdir -p sysroot
cd sysroot
7zr x ../sysroot_for_dev.7z
ln -s lib lib64
cd usr
ln -s lib lib64
cd ..
mv usr/bin2 usr/bin
mv bin2 bin
rm ../sysroot_for_dev.7z
