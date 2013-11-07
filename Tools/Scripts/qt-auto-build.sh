#!/bin/bash

QTDIR="/home/yangqi3/bsquask/build/qtbase-5.1.1"
LIBRADIR="/home/yangqi3/src/rasp-root/usr/lib"

#SDKROOT=$HOME
export PATH=$LIBRADIR:$PATH
export PATH=$QTDIR/bin:$PATH

echo $PATH
export BUILD_WEBKIT_ARGS="DEFINES=QT_NO_UITOOLS LIBS+=-lm \
       LIBS*=-lsqlite3 LIBS*=-lexpat LIBS*=-lfreetype LIBS*=-lz LIBS*=-lpthread \
	   LIBS*=-ldl LIBS*=-lgobject-2.0 LIBS*=-lgmodule-2.0 LIBS*=-lgthread-2.0 LIBS*=-lglib-2.0 LIBS*=-lffi  \
       QMAKE_CXXFLAGS+=-I$QTDIR/include \
       QMAKE_CXXFLAGS-=-O2 \
       QMAKE_CXXFLAGS+=-march=armv6 \
       QMAKE_CXXFLAGS+=-mfloat-abi=hard \
       QMAKE_CXXFLAGS+=-mfpu=vfp \
       QMAKE_CXXFLAGS+=-O3 \
       QMAKE_CXXFLAGS+=-fno-builtin-memcpy \
       QMAKE_LFLAGS+=-fno-builtin-memcpy \
       QMAKE_LFLAGS-=-Wl,-O1 \
       QMAKE_LFLAGS+=-Wl,-O2 \
       LIBS*=-L$LIBRADIR \
       LIBS*=-ldl \
	   DEFINES+=USE_GSTREAMER=1 DEFINES+=ENABLE_VIDEO=1 DEFINES+=WTF_USE_GSTREAMER=1 DEFINES+=ENABLE_GLIB_SUPPORT=1 \
	   "

export PKG_CONFIG_LIBDIR="$LIBRADIR/pkgconfig"
export QTDIR="/home/yangqi3/bsquask/build/qtbase-5.1.1"
echo $QTDIR

./webkit/Tools/Scripts/build-jsc \
--qt \
--release 

