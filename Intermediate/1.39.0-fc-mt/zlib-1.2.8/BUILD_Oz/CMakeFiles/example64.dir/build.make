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
CMAKE_BINARY_DIR = E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_Oz

# Include any dependencies generated for this target.
include CMakeFiles/example64.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/example64.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/example64.dir/flags.make

CMakeFiles/example64.dir/test/example.c.o: CMakeFiles/example64.dir/flags.make
CMakeFiles/example64.dir/test/example.c.o: CMakeFiles/example64.dir/includes_C.rsp
CMakeFiles/example64.dir/test/example.c.o: E:/TPS_HDD/UE4-HTML5-TPS/HTML5_Build/BatchFiles/ThirdParty/zlib/zlib-1.2.8/test/example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_Oz\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/example64.dir/test/example.c.o"
	E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\example64.dir\test\example.c.o   -c E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\example.c

CMakeFiles/example64.dir/test/example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example64.dir/test/example.c.i"
	E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\example.c > CMakeFiles\example64.dir\test\example.c.i

CMakeFiles/example64.dir/test/example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example64.dir/test/example.c.s"
	E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\example.c -o CMakeFiles\example64.dir\test\example.c.s

# Object files for target example64
example64_OBJECTS = \
"CMakeFiles/example64.dir/test/example.c.o"

# External object files for target example64
example64_EXTERNAL_OBJECTS =

example64.js: CMakeFiles/example64.dir/test/example.c.o
example64.js: CMakeFiles/example64.dir/build.make
example64.js: libz.bc
example64.js: CMakeFiles/example64.dir/linklibs.rsp
example64.js: CMakeFiles/example64.dir/objects1.rsp
example64.js: CMakeFiles/example64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_Oz\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable example64.js"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\example64.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/example64.dir/build: example64.js

.PHONY : CMakeFiles/example64.dir/build

CMakeFiles/example64.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\example64.dir\cmake_clean.cmake
.PHONY : CMakeFiles/example64.dir/clean

CMakeFiles/example64.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8 E:\TPS_HDD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8 E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_Oz E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_Oz E:\TPS_HDD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_Oz\CMakeFiles\example64.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/example64.dir/depend

