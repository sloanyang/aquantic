#!/bin/sh

rootdir=$PWD

export ARCH=arm
export CC=arm-raspberrypi-linux-gnueabi-gcc
export CXX=arm-raspberrypi-linux-gnueabi-g++
export LD=arm-raspberrypi-linux-gnueabi-ld
export BUILD_ROOT=$rootdir/3rdparty/RaspberryPi-BuildRoot/output/host
export PATH=$PATH:$BUILD_ROOT/usr/bin
export PKG_CONFIG_PATH=$BUILD_ROOT/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig

$rootdir/webkit/Tools/Scripts/update-webkitgtk-libs

