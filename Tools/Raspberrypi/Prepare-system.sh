#!/bin/sh

rootdir=$PWD/aquantic

cd $rootdir/3rdparty/RaspberryPi-BuildRoot
make raspberrypi_defconfig
make 
