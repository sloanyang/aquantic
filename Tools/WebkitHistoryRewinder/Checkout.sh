#!/bin/bash

rootdir=$PWD/../..

if [ $1 = "gtk" ]
then 
	revision=`cat gtk-version.txt`
	echo "Checking out to r$revision"
	git_revision=$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit
	git checkout $git_revision
	echo $((revision+1)) > gtk-version.txt
elif [ $1 = "uc" ]
	revision=`cat uc-version.txt`
	echo "Checking out to r$revision"
	git_revision=$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit
	git checkout $git_revision
	echo $((revision+1)) > gtk-version.txt
else
	echo "Error: not supported platform"


