#!/bin/bash

rootdir=$PWD

if [ $1 = "gtk" ]
then 
	revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtk-version.txt`
	echo "Checking out to r$revision"
	git_revision=`$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit`
	cd webkit
	git checkout $git_revision
	cd ..
	echo $((revision+1)) > $PWD/Tools/WebkitHistoryRewinder/gtk-version.txt
elif [ $1 = "uc" ]
then
	revision=`cat uc-version.txt`
	echo "Checking out to r$revision"
	git_revision=$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit
	git checkout $git_revision
	echo $((revision+1)) > gtk-version.txt
else
	echo "Error: not supported platform"
fi


