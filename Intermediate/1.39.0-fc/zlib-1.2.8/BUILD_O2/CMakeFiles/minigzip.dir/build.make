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
CMAKE_SOURCE_DIR = E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc\zlib-1.2.8\BUILD_O2

# Include any dependencies generated for this target.
include CMakeFiles/minigzip.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/minigzip.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/minigzip.dir/flags.make

CMakeFiles/minigzip.dir/test/minigzip.c.o: CMakeFiles/minigzip.dir/flags.make
CMakeFiles/minigzip.dir/test/minigzip.c.o: CMakeFiles/minigzip.dir/includes_C.rsp
CMakeFiles/minigzip.dir/test/minigzip.c.o: E:/TPS_HDD/UE4-HTML5-TPS/HTML5_Build/BatchFiles/ThirdParty/zlib/zlib-1.2.8/test/minigzip.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc\zlib-1.2.8\BUILD_O2\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/minigzip.dir/test/minigzip.c.o"
	E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\minigzip.dir\test\minigzip.c.o   -c E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\minigzip.c

CMakeFiles/minigzip.dir/test/minigzip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/minigzip.dir/test/minigzip.c.i"
	E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\minigzip.c > CMakeFiles\minigzip.dir\test\minigzip.c.i

CMakeFiles/minigzip.dir/test/minigzip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/minigzip.dir/test/minigzip.c.s"
	E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\minigzip.c -o CMakeFiles\minigzip.dir\test\minigzip.c.s

# Object files for target minigzip
minigzip_OBJECTS = \
"CMakeFiles/minigzip.dir/test/minigzip.c.o"

# External object files for target minigzip
minigzip_EXTERNAL_OBJECTS =

minigzip.js: CMakeFiles/minigzip.dir/test/minigzip.c.o
minigzip.js: CMakeFiles/minigzip.dir/build.make
minigzip.js: libz.bc
minigzip.js: CMakeFiles/minigzip.dir/linklibs.rsp
minigzip.js: CMakeFiles/minigzip.dir/objects1.rsp
minigzip.js: CMakeFiles/minigzip.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc\zlib-1.2.8\BUILD_O2\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable minigzip.js"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\minigzip.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/minigzip.dir/build: minigzip.js

.PHONY : CMakeFiles/minigzip.dir/build

CMakeFiles/minigzip.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\minigzip.dir\cmake_clean.cmake
.PHONY : CMakeFiles/minigzip.dir/clean

CMakeFiles/minigzip.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8 E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8 E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc\zlib-1.2.8\BUILD_O2 E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc\zlib-1.2.8\BUILD_O2 E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc\zlib-1.2.8\BUILD_O2\CMakeFiles\minigzip.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/minigzip.dir/depend

