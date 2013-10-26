#!/bin/bash

rootdir=$PWD

if [ $1 = "gtk" ]
then 
	if [ -e $PWD/Tools/WebkitHistoryRewinder/gtk-version-local.txt ]
	then
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtk-version-local.txt`
	else 
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtk-version.txt`
	fi

	echo "Checking out to r$revision"
	git_revision=`$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit`
	cd webkit
	git checkout $git_revision
	cd ..
	echo $((revision+1)) > $PWD/Tools/WebkitHistoryRewinder/gtk-version-local.txt

elif [ $1 = "uc" ]
then
	if [ -e $PWD/Tools/WebkitHistoryRewinder/uc-version-local.txt ]
	then
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/uc-version-local.txt`
	else 
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/uc-version.txt`
	fi

	echo "Checking out to r$revision"
	git_revision=`$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit`
	cd webkit
	git checkout $git_revision
	cd ..
	echo $((revision+1)) > $PWD/Tools/WebkitHistoryRewinder/uc-version-local.txt

else
	echo "Error: not supported platform"
fi


