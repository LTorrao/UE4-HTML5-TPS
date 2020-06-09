#!/bin/bash
set -x -e

# Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

# NOTE: this script needs to be built from Engine/Platforms/HTML5/Build/BatchFiles/Build_All_HTML5_libs.sh


# WARNING: connot build libs if absolute paths contains any space -- will revisit this in the future...
# WARNING: on OSX - max process per user may need to be bumped up...
#          see: https://gist.github.com/jamesstout/4546975#file-find_zombies-sh-L26-L46


# ----------------------------------------

PHYSX_VERSION='PhysX_3.4'
APEX_VERSION='APEX_1.4'
PHYSX_HTML5_SRC="$UE4_TPS_SRC/PhysX3/$PHYSX_VERSION"
PHYSX_HTML5_DST="$HTML5_TPS_LIBS/PhysX3/$PHYSX_VERSION"
export GW_DEPS_ROOT="$UE4_TPS_SRC/PhysX3"


# local destination
if [ ! -d "$PHYSX_HTML5_DST/lib-$UE_EMVER_LIBPATH" ]; then
	mkdir -p "$PHYSX_HTML5_DST/lib-$UE_EMVER_LIBPATH"
fi


# ----------------------------------------
# copy CMake files to PhysX location
FOLDERS=(	"$APEX_VERSION/compiler/cmake/html5"
			'NvCloth/compiler/cmake/html5'
			"$PHYSX_VERSION/Source/compiler/cmake/html5"
			'PxShared/src/compiler/cmake/html5'
		)
for f in ${FOLDERS[@]}; do
	rm -rf "$GW_DEPS_ROOT"/$f
	mkdir -p "$GW_DEPS_ROOT"/$f
	# https://stackoverflow.com/a/23163240
	PHYSX_SYSTEM=$(IFS=/ read -ra x <<<"$f" && printf "%s\n" "${x[0]}")
	cp -vp $PHYSX_SYSTEM/* "$GW_DEPS_ROOT"/$f/.
done

# ----------------------------------------
export CMAKE_MODULE_PATH="$GW_DEPS_ROOT/Externals/CMakeModules"

# ----------------------------------------
# WIP: WASM SIMD only available via upstream
if [ $UE_SIMD == 1 ]; then
	export UE_PHYSX_SIMD=1
fi
# ----------------------------------------


build_via_cmake()
{
	SUFFIX=_O$OLEVEL
	OPTIMIZATION=-O$OLEVEL
	# ----------------------------------------
#	rm -rf _BUILD/BUILD$SUFFIX
	mkdir -p _BUILD/BUILD$SUFFIX
	cd _BUILD/BUILD$SUFFIX

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
	if [ $OLEVEL == 0 ]; then
		SUFFIX=
	fi
	export LIB_SUFFIX=$SUFFIX

	# PhysX !!!
	rm -rf PhysX
	mkdir PhysX
	cd PhysX
	emcmake cmake -G "$EM_CMAKE_GEN_TYPE" \
		-DTARGET_BUILD_PLATFORM=html5 \
		-DPHYSX_ROOT_DIR="$GW_DEPS_ROOT"/$PHYSX_VERSION \
		-DPXSHARED_ROOT_DIR="$GW_DEPS_ROOT"/PxShared \
		-DNVTOOLSEXT_INCLUDE_DIRS="$GW_DEPS_ROOT"/$PHYSX_VERSION/externals/nvToolsExt/include \
		-DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=$UE_USE_BITECODE \
		-DCMAKE_BUILD_TYPE=$type \
		-DCMAKE_C_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
		-DCMAKE_CXX_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
		"$GW_DEPS_ROOT"/$PHYSX_VERSION/Source/compiler/cmake/html5
	cmake --build . -- -j VERBOSE=1 2>&1 | tee zzz_build.log
	cd ..


	# APEX !!!
	rm -rf APEX
	mkdir APEX
	cd APEX
	emcmake cmake -G "$EM_CMAKE_GEN_TYPE" \
		-DAPEX_ENABLE_UE4=1 \
		-DTARGET_BUILD_PLATFORM=html5 \
		-DPHYSX_ROOT_DIR="$GW_DEPS_ROOT"/$PHYSX_VERSION \
		-DPXSHARED_ROOT_DIR="$GW_DEPS_ROOT"/PxShared \
		-DNVSIMD_INCLUDE_DIR="$GW_DEPS_ROOT"/PxShared/src/NvSimd \
		-DNVTOOLSEXT_INCLUDE_DIRS="$GW_DEPS_ROOT"/$PHYSX_VERSION/externals/nvToolsExt/include \
		-DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=$UE_USE_BITECODE \
		-DCMAKE_BUILD_TYPE=$type \
		-DCMAKE_C_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
		-DCMAKE_CXX_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
		"$GW_DEPS_ROOT"/$APEX_VERSION/compiler/cmake/html5
	cmake --build . -- -j VERBOSE=1 2>&1 | tee zzz_build_apex.log
	cd ..


	if [ $UE_SIMD == 1 ]; then
		# NvCloth !!!
		rm -rf NvCloth
		mkdir NvCloth
		cd NvCloth
		emcmake cmake -G "$EM_CMAKE_GEN_TYPE" \
			-DTARGET_BUILD_PLATFORM=html5 \
			-DPXSHARED_ROOT_DIR="$GW_DEPS_ROOT"/PxShared \
			-DEMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES=$UE_USE_BITECODE \
			-DCMAKE_BUILD_TYPE=$type \
			-DCMAKE_C_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
			-DCMAKE_CXX_FLAGS_$TYPE="$OPTIMIZATION -D$DBGFLAG $EMFLAGS" \
			"$GW_DEPS_ROOT"/NvCloth/compiler/cmake/html5
		cmake --build . -- -j VERBOSE=1 2>&1 | tee zzz_build_nvcloth.log
		cd ..
	fi

#	cmake --build . -- -j VERBOSE=1
	# ----------------------------------------
	if [ $OLEVEL == "z" ]; then
		# for some reason: _Oz is not getting done here...
		cd PhysX
			find . -type f -name "*.$UE_LIB_EXT" -print | while read i; do b=`basename $i .$UE_LIB_EXT`; cp $i "$PHYSX_HTML5_DST"/lib-$UE_EMVER_LIBPATH/${b}_Oz.$UE_LIB_EXT; done
		cd ../APEX
			find . -type f -name "*.$UE_LIB_EXT" -print | while read i; do b=`basename $i .$UE_LIB_EXT`; cp $i "$PHYSX_HTML5_DST"/lib-$UE_EMVER_LIBPATH/${b}_Oz.$UE_LIB_EXT; done
		if [ $UE_SIMD == 1 ]; then
			cd ../NvCloth
				find . -type f -name "*.$UE_LIB_EXT" -print | while read i; do b=`basename $i .$UE_LIB_EXT`; cp $i "$PHYSX_HTML5_DST"/lib-$UE_EMVER_LIBPATH/${b}_Oz.$UE_LIB_EXT; done
		fi
		cd ..
	else
		cd PhysX
			find . -type f -name "*.$UE_LIB_EXT" -exec cp {} "$PHYSX_HTML5_DST/lib-$UE_EMVER_LIBPATH/." \;
		cd ../APEX
			find . -type f -name "*.$UE_LIB_EXT" -exec cp {} "$PHYSX_HTML5_DST/lib-$UE_EMVER_LIBPATH/." \;
		if [ $UE_SIMD == 1 ]; then
			cd ../NvCloth
				find . -type f -name "*.$UE_LIB_EXT" -exec cp {} "$PHYSX_HTML5_DST/lib-$UE_EMVER_LIBPATH/." \;
		fi
		cd ..
	fi
	cd ../..
}

if [ "$USE_INTERMEDIATE_PATH" == "1" ]; then
	mkdir -p $HOME/$UE_EMVER_LIBPATH/PhysX3
	cd $HOME/$UE_EMVER_LIBPATH/PhysX3
fi
#type=Debug;       OLEVEL=0;  build_via_cmake
type=Release;     OLEVEL=2;  build_via_cmake
type=Release;     OLEVEL=3;  build_via_cmake
type=MinSizeRel;  OLEVEL=z;  build_via_cmake
ls -l "$PHYSX_HTML5_DST/lib-$UE_EMVER_LIBPATH"

