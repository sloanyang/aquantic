#!/bin/bash

rootdir=$PWD/aquantic
rm $rootdir/webkit/Tools/gtk -rf

if [ ! -d $rootdir/webkit/WebKitBuild/Release/Libraries ] 
then 
	mkdir -p $rootdir/webkit/WebKitBuild/Release/Libraries 
fi

if [ ! -d $rootdir/webkit/WebKitBuild/Release/TestNetscapePlugin ] 
then 
	mkdir -p $rootdir/webkit/WebKitBuild/Release/TestNetscapePlugin
fi

