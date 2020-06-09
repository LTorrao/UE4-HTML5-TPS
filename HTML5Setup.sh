#!/usr/bin/env bash
# Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

set -e  # exit immediately on error
#set -x  # print commands


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
H5PATCHES="$H5PLATFORM/Build/PatchFiles/emsdk-$EMVER"
ENGINE=$(cd $H5PLATFORM/../..; pwd)

# using Intermediate path that is also used during UE4 HTML5 packaging
export HOME="$H5PLATFORM/Intermediate"
export USE_INTERMEDIATE_PATH=1

if [ ! -d "$HOME" ]; then
	mkdir -p "$HOME"
fi
LOG_FILE="$HOME/zzz_warnings.txt"
echo "" > "$LOG_FILE"


# --------------------------------------------------------------------------------
# PATCH Unreal Engine Files

patch_UBT_HTML5()
{
	# inject HTML5 platform back into UnrealBuildTool.csproj
	# https://github.com/UnrealEngineHTML5/Documentation/blob/master/Platforms/HTML5/HowTo/README.1.emscripten.UE4.HTML5.md#unrealbuildtool-html5-injection

	# backup original jic...
	csproj="$ENGINE/Source/Programs/UnrealBuildTool/UnrealBuildTool.csproj"
	if [ ! -e $csproj.save ]; then
		mv $csproj $csproj.save
	fi
HTML5PLATFORM=$(cat <<__UBT_HTMLFIVE
	<When Condition="Exists('Platform\\\\HTML5\\\\UEBuildHTML5.cs')">
      <ItemGroup>
        <Compile Include="Platform\\\\HTML5\\\\HTML5ProjectGenerator.cs" />
        <Compile Include="Platform\\\\HTML5\\\\HTML5ToolChain.cs" />
        <Compile Include="Platform\\\\HTML5\\\\UEBuildHTML5.cs" />
        <Compile Include="Platform\\\\HTML5\\\\HTML5SDKInfo.cs" />
      </ItemGroup>
    </When>
  </Choose>
  <Choose>
__UBT_HTMLFIVE
)
	cat $csproj.save | perl -p -e s"!(.*Exists.*UEBuildLinux.*)!$HTML5PLATFORM\n\1!" > $csproj
}
patch_UBT_HTML5

patch_AutoTool_HTML5()
{
	# inject HTML5LaunchHelper in to visual studio programs list

	# backup original jic...
	csproj="$ENGINE/Source/Programs/AutomationTool/Scripts/BuildCommonTools.Automation.cs"
	if [ ! -e $csproj.save ]; then
		mv $csproj $csproj.save
	fi
HTML5PLATFORM=$(cat <<__AT_HTMLFIVE
		// HTML5 binaries
// NOTE: even removing this check -- HTML5LaunchHelper is still not getting
//       automatically getting included in the UE4.sln after running:
//       GenerateProjectFiles.bat
// HELP WANTED: would be greatly appreciated ^_^
// P.S. -- HTML5LaunchHelper isn't really needed (unless you reeeeeally want to Launch from Editor)
//      -- you can use the "simple python http server" instead of HTML5LaunchHelper:
//         https://github.com/UnrealEngineHTML5/Documentation/blob/master/Platforms/HTML5/HowTo/README.1.emscripten.UE4.HTML5.md#on-windows-mac-or-linux-via-command-line
//		if (Platforms.Contains(UnrealBuildTool.UnrealTargetPlatform.HTML5))
		{
			Agenda.DotNetProjects.Add(@"Engine/Platforms/HTML5/Source/Programs/HTML5/HTML5LaunchHelper/HTML5LaunchHelper.csproj");
			ExtraBuildProducts.Add(CommandUtils.CombinePaths(CommandUtils.CmdEnv.LocalRoot, @"Engine/Binaries/DotNET/HTML5LaunchHelper.exe"));
		}

__AT_HTMLFIVE
)
	cat $csproj.save | perl -p -e s"!(.*return Agenda.*)!$HTML5PLATFORM\n\1!" > $csproj
}
patch_AutoTool_HTML5

patch_UE4_code()
{
	# ----------------------------------------
	# this file was not checked in to demonstrate how to fix this important bug
	# https://github.com/UnrealEngineHTML5/Documentation/blob/master/Platforms/HTML5/HowTo/README.4.faq.UE4.HTML5.md#tobool63i--icmp-slt-i176

	# backup original jic...
	scene_h="$ENGINE/Source/Runtime/Engine/Classes/Engine/Scene.h"
	if [ ! -e $scene_h.save ]; then
		mv $scene_h $scene_h.save
	fi
	cat $scene_h.save | perl -0p -e "s/uint\d+\s+(.+)\s?:\s?1;/bool \1;/g" > $scene_h

	# ----------------------------------------
	# sigh...
	if [[ $SYSTEM == 'Darwin' ]]; then
		chmod +x $ENGINE/Binaries/ThirdParty/Python/Mac/bin/python*
	fi

	# ----------------------------------------
	# 4.24.3 fixes
	# backup original jic...
	systemtextures_cpp="$ENGINE/Source/Runtime/Renderer/Private/SystemTextures.cpp"
	if [ ! -e $systemtextures_cpp.save ]; then
		mv $systemtextures_cpp $systemtextures_cpp.save
	fi
REPLACE_CODE='#ifdef __EMSCRIPTEN__
\1PF_B8G8R8A8\3
#else
\1\2\3
#endif'
	cat $systemtextures_cpp.save | perl -0p -e "s/(.*)(PF_R32_UINT)(.*)/$REPLACE_CODE/" > $systemtextures_cpp
}
patch_UE4_code

patch_emscripten()
{
	empath="upstream/emscripten"
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# XXX this is temp until upstream becomes fully default
if [ ! -d $empath ]; then
	empath="fastcomp/emscripten"
fi
# ////////////////////////////////////////
	if [ ! -d $empath ]; then
		echo "ERROR: emsdk-$EMVER is missing"
		exit -1
	fi

	# try to apply EPIC EDIT patches:
	# - https://github.com/UnrealEngineHTML5/Documentation/blob/master/Platforms/HTML5/HowTo/README.1.emscripten.UE4.HTML5.md#patching-emscripten
	if [ ! -d "$H5PATCHES" ]; then
		cat << EPIC_EDIT_PATCHES >> "$LOG_FILE"


WARNING: no 'EPIC EDIT' patches folder found.
         this means that VANILLA emscripten toolchain ($EMVER) was used.

NOTE: this script can just be re-run if patchfile folder was created.

for more information, please see:
	https://github.com/UnrealEngineHTML5/Documentation/blob/master/Platforms/HTML5/HowTo/README.1.emscripten.UE4.HTML5.md#patching-emscripten


EPIC_EDIT_PATCHES
	else
		if [ -d "$H5PATCHES/emscripten" ]; then
			cp -r $H5PATCHES/emscripten/* $empath/.
		fi
		if [[ $SYSTEM == *'_NT-'* ]]; then
# TODO: now that python3 is default -- need to see if windows python(2) patches are still needed for python3...
# for now, do not print warnings as python3 seems to work "as-is" with ue4 - 4.24.3
#			# python on windows is a little broken...
#			if [ -d "$H5PATCHES/python-2.7.13.1_win64only/Lib" ]; then
#				if [ -d python/2.7.13.1_64bit/python-2.7.13.amd64/Lib ]; then
#					cp -r $H5PATCHES/python-2.7.13.1_win64only/Lib/* python/2.7.13.1_64bit/python-2.7.13.amd64/Lib/.
#				else
#					echo "WARNING: emsdk-$EMVER (windows) python PATH NOT FOUND -- skipping EPIC patches here" >> "$LOG_FILE"
#				fi
#			fi
		fi
	fi


	# ----------------------------------------
	# SIMD is WIP...
#	upstream/emscripten/system/include/wasm_simd128.h:// EPIC EDIT -- xmmintrin.h -- START
#	upstream/emscripten/system/include/wasm_simd128.h:// EPIC EDIT -- xmmintrin.h -- END
#	upstream/emscripten/system/include/wasm_simd128.h:// EPIC EDIT -- emmintrin.h -- START
#	upstream/emscripten/system/include/wasm_simd128.h:// EPIC EDIT -- emmintrin.h -- END

}


# --------------------------------------------------------------------------------
if [ ! -d "Build/emsdk" ]; then
	mkdir -p Build/emsdk
fi

fetch_emscripten()
{
	cd "$H5PLATFORM/Build/emsdk"

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

	patch_emscripten
}

build_thirdparty_libs()
{
	llvmbackend=$1

	cd "$H5PLATFORM/Build/BatchFiles"

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

