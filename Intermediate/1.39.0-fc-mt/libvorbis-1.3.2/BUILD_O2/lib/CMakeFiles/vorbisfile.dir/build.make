# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\TPS_HDD\UE4-HTML5-TPS\UE4_ThirdParty\Vorbis\libvorbis-1.3.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2

# Include any dependencies generated for this target.
include lib/CMakeFiles/vorbisfile.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/vorbisfile.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/vorbisfile.dir/flags.make

lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.o: lib/CMakeFiles/vorbisfile.dir/flags.make
lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.o: lib/CMakeFiles/vorbisfile.dir/includes_C.rsp
lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.o: E:/TPS_HDD/UE4-HTML5-TPS/UE4_ThirdParty/Vorbis/libvorbis-1.3.2/lib/vorbisfile.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.o"
	cd /d E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib && E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\vorbisfile.dir\vorbisfile.c.o   -c E:\TPS_HDD\UE4-HTML5-TPS\UE4_ThirdParty\Vorbis\libvorbis-1.3.2\lib\vorbisfile.c

lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vorbisfile.dir/vorbisfile.c.i"
	cd /d E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib && E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\TPS_HDD\UE4-HTML5-TPS\UE4_ThirdParty\Vorbis\libvorbis-1.3.2\lib\vorbisfile.c > CMakeFiles\vorbisfile.dir\vorbisfile.c.i

lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vorbisfile.dir/vorbisfile.c.s"
	cd /d E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib && E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\TPS_HDD\UE4-HTML5-TPS\UE4_ThirdParty\Vorbis\libvorbis-1.3.2\lib\vorbisfile.c -o CMakeFiles\vorbisfile.dir\vorbisfile.c.s

# Object files for target vorbisfile
vorbisfile_OBJECTS = \
"CMakeFiles/vorbisfile.dir/vorbisfile.c.o"

# External object files for target vorbisfile
vorbisfile_EXTERNAL_OBJECTS =

lib/libvorbisfile.bc: lib/CMakeFiles/vorbisfile.dir/vorbisfile.c.o
lib/libvorbisfile.bc: lib/CMakeFiles/vorbisfile.dir/build.make
lib/libvorbisfile.bc: lib/CMakeFiles/vorbisfile.dir/objects1.rsp
lib/libvorbisfile.bc: lib/CMakeFiles/vorbisfile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libvorbisfile.bc"
	cd /d E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib && $(CMAKE_COMMAND) -P CMakeFiles\vorbisfile.dir\cmake_clean_target.cmake
	cd /d E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\vorbisfile.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/vorbisfile.dir/build: lib/libvorbisfile.bc

.PHONY : lib/CMakeFiles/vorbisfile.dir/build

lib/CMakeFiles/vorbisfile.dir/clean:
	cd /d E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib && $(CMAKE_COMMAND) -P CMakeFiles\vorbisfile.dir\cmake_clean.cmake
.PHONY : lib/CMakeFiles/vorbisfile.dir/clean

lib/CMakeFiles/vorbisfile.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\TPS_HDD\UE4-HTML5-TPS\UE4_ThirdParty\Vorbis\libvorbis-1.3.2 E:\TPS_HDD\UE4-HTML5-TPS\UE4_ThirdParty\Vorbis\libvorbis-1.3.2\lib E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2 E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\libvorbis-1.3.2\BUILD_O2\lib\CMakeFiles\vorbisfile.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/vorbisfile.dir/depend

