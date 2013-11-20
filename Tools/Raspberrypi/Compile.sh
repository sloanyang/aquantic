#!/bin/sh

rootdir=$PWD/aquantic

export ARCH=arm-bcm2708hardfp-linux-gnueabi
export CC=arm-bcm2708hardfp-linux-gnueabi-gcc
export CXX=arm-bcm2708hardfp-linux-gnueabi-g++
export LD=arm-bcm2708hardfp-linux-gnueabi-ld
export BUILD_ROOT=$rootdir/3rdparty/RaspberryPi-BuildRoot/output/host
export ROOTFS_DIR=$rootdir/3rdparty/RaspberryPi-BuildRoot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
export PATH=$PATH:$BUILD_ROOT/usr/bin
export CXXFLAGS="-I$ROOTFS_DIR/usr/include -I$ROOTFS_DIR/usr/include/glib-2.0 -I$ROOTFS_DIR/usr/lib/glib-2.0/include"
export CFLAGS="-I$ROOTFS_DIR/usr/include -I$ROOTFS_DIR/usr/include/glib-2.0 -I$ROOTFS_DIR/usr/lib/glib-2.0/include"
export CPPFLAGS="-I$ROOTFS_DIR/usr/include -I$ROOTFS_DIR/usr/include/glib-2.0 -I$ROOTFS_DIR/usr/lib/glib-2.0/include"
export LDFLAGS="-L$ROOTFS_DIR/usr/lib -licuuc -licui18n"

SYSROOT=$rootdir/3rdparty/RaspberryPi-BuildRoot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot

export PKG_CONFIG_DIR=
export PKG_CONFIG_LIBDIR=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
export PKG_CONFIG_PATH=${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig
export PKG_CONFIG_SYSROOT_DIR=${SYSROOT}

./webkit/Tools/Scripts/build-jsc --gtk --release --enable-webkit1=yes --enable-webkit2=no --host=$ARCH icu_config=$ROOTFS_DIR/usr/ --with-gtk=2.0 --with-sysroot=$ROOTFS_DIR --disable-introspection --enable-static=yes --enable-shared=no 
