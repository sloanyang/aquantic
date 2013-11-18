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

	stop_revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtk-version-end.txt`

	if [ ! -d $PWD/webkit/WebKitBuild ]
	then
		mkdir $PWD/webkit/WebKitBuild
	fi

	echo "Checking out to r$revision"
	git_revision=`$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit`
	cd webkit

	if [ $((revision)) -lt $((stop_revision)) ] 
	then 
		git checkout -f $git_revision
		cd ..
		echo $((revision+100)) > $PWD/Tools/WebkitHistoryRewinder/gtk-version-local.txt
	else
		cd ..
		exit 2
	fi

elif [ $1 = "uc" ]
then
	if [ -e $PWD/Tools/WebkitHistoryRewinder/uc-version-local.txt ]
	then
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/uc-version-local.txt`
	else 
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/uc-version.txt`
	fi

	stop_revision=`cat $PWD/Tools/WebkitHistoryRewinder/uc-version-end.txt`

	if [ ! -d $PWD/webkit/WebKitBuild ]
	then
		mkdir $PWD/webkit/WebKitBuild
	fi

	echo "Checking out to r$revision"
	git_revision=`$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit`
	cd webkit

	if [ $((revision)) -lt $((stop_revision)) ] 
	then 
		git checkout -f $git_revision
		cd ..
		echo $((revision+100)) > $PWD/Tools/WebkitHistoryRewinder/uc-version-local.txt
	else
		cd ..
		exit 2
	fi

elif [ $1 = "gtkArm" ]
then
	if [ -e $PWD/Tools/WebkitHistoryRewinder/gtkArm-version-local.txt ]
	then
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtkArm-version-local.txt`
	else 
		revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtkArm-version.txt`
	fi

	stop_revision=`cat $PWD/Tools/WebkitHistoryRewinder/gtkArm-version-end.txt`

	if [ ! -d $PWD/webkit/WebKitBuild ]
	then
		mkdir $PWD/webkit/WebKitBuild
	fi

	echo "Checking out to r$revision"
	git_revision=`$rootdir/Tools/Scripts/git-svn.sh find-rev $revision $rootdir/webkit`
	cd webkit

	if [ $((revision)) -lt $((stop_revision)) ] 
	then 
		git checkout -f $git_revision
		cd ..
		echo $((revision+100)) > $PWD/Tools/WebkitHistoryRewinder/gtkArm-version-local.txt
	else
		cd ..
		exit 2
	fi


else
	echo "Error: not supported platform"
fi


