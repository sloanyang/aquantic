#!/bin/sh

rootdir=$PWD

cd $rootdir/3rdparty/RaspberryPi-BuildRoot
make raspberrypi_defconfig
make 
