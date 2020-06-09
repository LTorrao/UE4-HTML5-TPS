#!/bin/bash
set -x -e

# Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

# NOTE: this script needs to be built from Engine/Platforms/HTML5/Build/BatchFiles/Build_All_HTML5_libs.sh


OPUS_HTML5=$(pwd)
OPUS_VERSION='opus-1.1'
OPUS_HTML5_SRC="$UE4_TPS_SRC/libOpus/$OPUS_VERSION"
OPUS_HTML5_DST="$HTML5_TPS_LIBS/libOpus/$OPUS_VERSION"


# local destination
if [ ! -d "$OPUS_HTML5_DST/lib-$UE_EMVER_LIBPATH" ]; then
	mkdir -p "$OPUS_HTML5_DST/lib-$UE_EMVER_LIBPATH"
fi


# ----------------------------------------
# add CMakeLists.txt to src
cp $OPUS_VERSION/CMakeLists.txt "$OPUS_HTML5_SRC"/.
# ----------------------------------------


build_via_cmake()
{
	SUFFIX=_O$OLEVEL
	OPTIMIZATION=-O$OLEVEL
	# ----------------------------------------
	rm -rf BUILD$SUFFIX
	mkdir BUILD$SUFFIX
	cd BUILD$SUFFIX
	# ----------------------------------------
#	TYPE=${type^^} # OSX-bash doesn't like this
	TYPE=`echo $type | tr "[:lower:]" "[:upper:]"`
	if [ $TYPE == "DEBUG" ]; then
		DBGFLAG=_DEBUG
	else
		DBGFLAG=NDEBUG
	fi
	EMFLAGS="$UE_EMFLAGS"
	# ----------------------------------------
	emcmake cmake -G "$EM_CMAKE_GEN_TYPE" \
		-DBUILD_SHARED_LIBS=OFF \
		-DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=$UE_USE_BITECODE \
		-DCMAKE_BUILD_TYPE=$type \
		-DCMAKE_C_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
		"$OPUS_HTML5_SRC"
	cmake --build . -- opus -j VERBOSE=1 2>&1 | tee zzz_build.log
	# ----------------------------------------
	if [ $OLEVEL == 0 ]; then
		SUFFIX=
	fi
	cp libopus.$UE_LIB_EXT "$OPUS_HTML5_DST"/lib-$UE_EMVER_LIBPATH/libopus${SUFFIX}.$UE_LIB_EXT
	# ----------------------------------------
	# speex_resampler
	mkdir speex_resampler
	cd speex_resampler
	mkdir include src
	cp "$OPUS_HTML5_SRC"/include/speex_resampler.h include/.
	cp "$OPUS_HTML5_SRC"/speex_resampler/*.* src/.
	cd src
	SRCFILE=resample.c
	emcc $OPTIMIZATION -D$DBGFLAG $EMFLAGS -DOUTSIDE_SPEEX -I../include -Wall -Wextra -Wcast-align -Wnested-externs -Wshadow -Wstrict-prototypes -Wno-sign-compare -o $SRCFILE.o -c $SRCFILE
	if [ $UE_USE_BITECODE == 'OFF' ]; then
		cp $SRCFILE.o "$OPUS_HTML5_DST"/lib-$UE_EMVER_LIBPATH/libspeex_resampler${SUFFIX}.o
	else
		emcc -o libspeex_resampler.$UE_LIB_EXT -r $SRCFILE.o
		cp libspeex_resampler.$UE_LIB_EXT "$OPUS_HTML5_DST"/lib-$UE_EMVER_LIBPATH/libspeex_resampler${SUFFIX}.$UE_LIB_EXT
	fi
	cd ../..
	# ----------------------------------------
	cd ..
}

if [ "$USE_INTERMEDIATE_PATH" == "1" ]; then
	mkdir -p $HOME/$UE_EMVER_LIBPATH/$OPUS_VERSION
	cd $HOME/$UE_EMVER_LIBPATH/$OPUS_VERSION
fi
#type=Debug;       OLEVEL=0;  build_via_cmake
type=Release;     OLEVEL=2;  build_via_cmake
type=Release;     OLEVEL=3;  build_via_cmake
type=MinSizeRel;  OLEVEL=z;  build_via_cmake
ls -l "$OPUS_HTML5_DST/lib-$UE_EMVER_LIBPATH"

