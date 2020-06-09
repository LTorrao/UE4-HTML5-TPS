#!/usr/bin/env bash
# Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

set -e  # exit immediately on error
#set -x  # print commands

# --------------------------------------------------------------------------------
# remember to source your emscripten's env settings before using this script:
#   e.g.> source .../emsdk_clone/emsdk_env.sh
# a.k.a.> . .../emsdk_clone/emsdk_env.sh


# --------------------------------------------------------------------------------
# prechecks

SYSTEM=$(uname)

# ........................................
# cmake version checks
version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

# ICU
ver=$(cmake --version | egrep -o '[0-9].*\.[0-9]')
if version_gt 3.12 $ver; then
     echo *** ERROR: CMake must be greater than 3.12
     exit -1
fi

# ........................................
# python

if ! [ -x "$(command -v python)" ]; then
     echo *** ERROR: python is not found
     exit -1
fi


# --------------------------------------------------------------------------------
# configs

EMSDKVER='1.39.0' # TODO: obtain this from emcc --version
LLVMBACKEND=0 # BUGHUNT: upstream will be come default -- in the meantime: => 0:(use fastcomp emsdk_env.sh)  1:(use upstream emsdk_env.sh)
export UE_SIMD=0 # TEST TEST TEST .. this is WIP


# --------------------------------------------------------------------------------
# helpers for new "platforms" path

export UE4_TPS_SRC="$(pwd)/../../../../Source/ThirdParty"
export HTML5_TPS_LIBS="$(pwd)/../../Source/ThirdParty"
TPS_HTML5_SCRIPTS="$(pwd)/ThirdParty"


# --------------------------------------------------------------------------------
buildall()
{
	# ------------------------------------------------------------
	# setup build flags
	
	_EMFLAGS='-s WASM=1'
	_EMSDKVER=''
	if [ $LLVMBACKEND == 1 ]; then
		export UE_USE_BITECODE='OFF'
		export UE_LIB_EXT='a'
	
		_EMFLAGS+=' -s WASM_OBJECT_FILES=1'
		_EMSDKVER='-up'
		if [ $MULTITHREADED == 1 ]; then
			_EMFLAGS+=' -s USE_PTHREADS'
			_EMSDKVER+='-mt'
		fi
		if [ $UE_SIMD == 1 ]; then
			# only available from upstream (this automatically appends -msimd128)
			_EMFLAGS+=' -s SIMD=1'
			_EMSDKVER+='-simd'
		fi
	else
# WARNING: THIS ELSE BLOCK WILL GO AWAY ...some day...
		export UE_USE_BITECODE='ON'
		export UE_LIB_EXT='bc'
		_EMSDKVER='-fc' # i.e. fastcomp
#_EMSDKVER='-upbc' # i.e. upstream without '-s WASM_OBJECT_FILES=1' -- THIS DOES NOT WORK ??? (see ../../Setup.sh for details)
		if [ $MULTITHREADED == 1 ]; then
			_EMFLAGS+=' -s USE_PTHREADS'
			_EMSDKVER+='-mt'
		fi
		export UE_PHYSX_FASTCOMP=1
	fi
	# ----------------------------------------
	if [[ $SYSTEM == *'_NT-'* ]]; then
		_EMFLAGS+=' -Wno-implicit-function-declaration'
		export EM_CMAKE_GEN_TYPE='MinGW Makefiles'
#		export EM_CMAKE_GEN_TYPE='Visual Studio 15 2017'
	else
		export EM_CMAKE_GEN_TYPE='Unix Makefiles'
	fi
	# ----------------------------------------
	export UE_EMFLAGS=$_EMFLAGS
	export UE_EMVER_LIBPATH="${EMSDKVER}${_EMSDKVER}"
	rm -f zzz_results-$UE_EMVER_LIBPATH.txt
	
	# ------------------------------------------------------------
	# build all ThirdParty libs for HTML5
	
	cd "$TPS_HTML5_SCRIPTS"/zlib;      ./build_html5_zlib.sh
	cd "$TPS_HTML5_SCRIPTS"/libPNG;    ./build_html5_libPNG.sh
	
	cd "$TPS_HTML5_SCRIPTS"/Ogg;       ./build_html5_Ogg.sh
	cd "$TPS_HTML5_SCRIPTS"/Vorbis;    ./build_html5_Vorbis.sh
	cd "$TPS_HTML5_SCRIPTS"/libOpus;   ./build_html5_libOpus.sh
	
	# WARNING: building ICU might take a while...
	cd "$TPS_HTML5_SCRIPTS"/ICU;       ./build_html5_ICU.sh
	
	cd "$TPS_HTML5_SCRIPTS"/HarfBuzz;  ./build_html5_HarfBuzz.sh
	
	cd "$TPS_HTML5_SCRIPTS"/FreeType2; ./build_html5_FreeType2.sh
	
	# WARNING: building PhysX might take a while...
	# WARNING -- WARNING -- WARNING -- WARNING
	#    WINDOWS may stall here at the end of each library build (-O2 -O3 -Oz etc.)
	#    the zombie python process may have to be manually killed (via task manager) to get this moving again...
	# WARNING -- WARNING -- WARNING -- WARNING
	cd "$TPS_HTML5_SCRIPTS"/PhysX3;    ./build_html5_PhysX3.sh
	
	# WARNING: building SDL2 might take a while...
# removed SDL2 for HTML5 on UE4
#	cd "$TPS_HTML5_SCRIPTS"/SDL2;      ./build_html5_SDL2.sh
	
	# ------------------------------------------------------------
	# build results - sometimes, build does not stop (even with set -e), scan for those here...
	
	cd "$TPS_HTML5_SCRIPTS"
	# known error types: PhysX|ICU
	ERR=$( find . -type f -name "zzz_build*.log" -exec egrep -H -l 'ERROR|Error:' {} \; )
	if [ "X$ERR" != "X" ]; then
		echo $ERR
		echo '*** BUILD ERROR DETECTED [ERROR|Error:] *** MULTITHREADED: ' $MULTITHREADED
		play_audio_feedback -1
		exit -1
	fi
	# double check
	ERR=$( find . -type f -name "zzz_build*.log" -print | while read i; do egrep -q '100%' "$i"; if [[ $? != 0 ]]; then echo $i; fi; done )
	if [ "X$ERR" != "X" ]; then
		echo $ERR
		echo '*** BUILD ERROR DETECTED [100% missing] *** MULTITHREADED: ' $MULTITHREADED
		play_audio_feedback -1
		exit -1
	fi

	# warm fuzzy -- print all "linking" target results
	if [ "$USE_INTERMEDIATE_PATH" == "1" ]; then
		cd $HOME/$UE_EMVER_LIBPATH
	fi
	find . -type f -name "zzz_build*.log" -exec egrep "Linking" {} \; | tee zzz_results-$UE_EMVER_LIBPATH.txt
}


# --------------------------------------------------------------------------------
# lemme know when build is done!

play_audio_feedback()
{
	# ----------------------------------------
	if [[ $SYSTEM == *'_NT-'* ]]; then
		PLAY='/C/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c (New-Object Media.SoundPlayer "C:\Windows\Media\Windows Hardware Insert.wav").PlaySync();'
		if [ $# != 0 ]; then
			PLAY='/C/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c (New-Object Media.SoundPlayer "C:\Windows\Media\Windows Hardware Remove.wav").PlaySync();'
		fi
		$PLAY
		$PLAY
		$PLAY
		return
	fi
	# ----------------------------------------
	fname=/usr/share/sounds/sound-icons/glass-water-1.wav
	if [ $# != 0 ]; then
		fname=/usr/share/sounds/sound-icons/piano-3.wav
	fi
	play -q $fname
	play -q $fname
	play -q $fname
}


# --------------------------------------------------------------------------------
# MAIN

if [ $UE_SIMD == 0 ]; then # WIP: remove if check after SIMD build tests are successful
	MULTITHREADED=0
	buildall
fi

MULTITHREADED=1
buildall


# --------------------------------------------------------------------------------
echo 'Success!'
play_audio_feedback


