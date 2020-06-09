#!/usr/bin/env bash
# Copyright Epic Games, Inc. All Rights Reserved.

set -e  # exit immediately on error
#set -x  # print commands


# --------------------------------------------------------------------------------


# HTML5-TPS NOTES:
#
# this script is based on:
# https://github.com/UnrealEngineHTML5/UnrealEngine/blob/4.24-html5/Engine/Platforms/HTML5/HTML5Setup.sh
#
# modified to just build opensource thirdparty software (TPS) used in UE4 HTML5
# for testing purposes (we are seeing strange SSD build errors):
# https://github.com/UnrealEngineHTML5/Documentation/issues/5
#
# created new repo to help narrow down TPS build errors
# as well as testing new emscripten toolchain versions


# --------------------------------------------------------------------------------
# last successful tested versions
EMVER="1.39.0"
MINGVER="mingw-7.1.0-64bit"


# --------------------------------------------------------------------------------
# prechecks (replicated from Build_All_HTML5_libs.sh...)

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
# temporarily point HOME path to an intermediate path

SCRIPTDIR="${0%/*}"
H5PLATFORM=$(cd $SCRIPTDIR; pwd)

# using Intermediate path that is also used during UE4 HTML5 packaging
export HOME="$H5PLATFORM/Intermediate"
export USE_INTERMEDIATE_PATH=1

if [ ! -d "$HOME" ]; then
	mkdir -p "$HOME"
fi
LOG_FILE="$HOME/zzz_warnings.txt"
echo "" > "$LOG_FILE"

# --------------------------------------------------------------------------------
if [ ! -d "HTML5_Build/emsdk" ]; then
	mkdir -p HTML5_Build/emsdk
fi

fetch_emscripten()
{
	cd "$H5PLATFORM/HTML5_Build/emsdk"

	DO_INSTALL=1
	if [[ -d "emsdk-$EMVER" && -e "emsdk-$EMVER/emsdk" ]]; then
		# downloaded already
		DO_INSTALL=0
	fi
	if [ "$DO_INSTALL" == "1" ]; then
		git clone https://github.com/emscripten-core/emsdk emsdk-$EMVER
	fi
	cd emsdk-$EMVER

	# ----------------------------------------
	if [ "$DO_INSTALL" == "1" ]; then
		./emsdk install $EMVER
	fi
	./emsdk activate $EMVER
	# ----------------------------------------
	if [[ $SYSTEM == *'_NT-'* ]]; then
		if [ "$DO_INSTALL" == "1" ]; then
			./emsdk install $MINGVER
		fi
		./emsdk activate $MINGVER
	fi
}

build_thirdparty_libs()
{
	llvmbackend=$1

	cd "$H5PLATFORM/HTML5_Build/BatchFiles"

	. ../emsdk/emsdk-$EMVER/emsdk_env.sh

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# XXX these are temp until upstream becomes fully default
if [ ! -e Build_All_HTML5_libs.sh.save ]; then
	# backup original jic...
	mv Build_All_HTML5_libs.sh Build_All_HTML5_libs.sh.save
fi
cat Build_All_HTML5_libs.sh.save | perl -0p -e s"/(LLVMBACKEND)=\d/\1=$llvmbackend/" > Build_All_HTML5_libs.sh
chmod +x Build_All_HTML5_libs.sh
# ........................................
if [[ $SYSTEM == *'_NT-'* ]]; then
	if [ "$BUILT_ONCE_ON_WINDOZE" == "1" ]; then
		echo "ERROR: RUN build_thirdparty_libs() only once -- there is problem when running it more than once in a single shell session (again, only on windows...)"
		exit -1
	fi
	BUILT_ONCE_ON_WINDOZE=1
fi
# ////////////////////////////////////////

	./Build_All_HTML5_libs.sh
}


# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# XXX  ue4 currently crashes at runtime in the browser:
#      - when building everything with upstream [-s WASM_OBJECT_FILES=1]
#      - when building everything with upstream [-s WASM_OBJECT_FILES=0]
#      - when building everything with upstream/fastcomp [-s WASM_OBJECT_FILES=0]
# BUT! building 3rd party libs with "fastcomp toolchain" [(i.e.) -s WASM_OBJECT_FILES=0]
#      - then, can use upstream/fastcomp to finish building UE4 without crashing in the browser
#
# fetch upstream but do not build 3rd party libs with upstream toolchain (unless you're an emscripten developer =)
# we will however use it for building ue4 projects with it
# ////////////////////////////////////////

fetch_emscripten
#build_thirdparty_libs 1


# ================================================================================
###  EVERYTHING BELOW HERE WILL GO AWAY  !!!  (when upstream becomes fully stable)
###  EVERYTHING BELOW HERE WILL GO AWAY  !!!  (when upstream becomes fully stable)
###  EVERYTHING BELOW HERE WILL GO AWAY  !!!  (when upstream becomes fully stable)
# ================================================================================

# the following was attempting to use upstream/fastcomp to build everything... but, html5 runtime crashes in browser...

#	# build libs
#	. ../emsdk/emsdk-$EMVER/emsdk_env.sh
#	if [ ! -e Build_All_HTML5_libs.sh.save ]; then
#		# backup original jic...
#		mv Build_All_HTML5_libs.sh Build_All_HTML5_libs.sh.save
#	fi
#	EMPATH=$(cat $HOME/.emscripten | perl -nle "while(<>) { /EMSCRIPTEN_ROOT = '(.+)'/ && print \$1; }")
#	export PATH=$EMPATH:$PATH
#	./Build_All_HTML5_libs.sh

# ----------------------------------------

# repeat: as of 1.39.0 -- can only link against "$EMVER-fastcomp" libs on UE4 projects successfully


EMVER="$EMVER-fastcomp"
fetch_emscripten
build_thirdparty_libs 0


# ================================================================================
# show any warnings from this script

cat "$LOG_FILE"

