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
CMAKE_SOURCE_DIR = D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\TPS_SSD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_O2

# Include any dependencies generated for this target.
include CMakeFiles/example.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/example.dir/flags.make

CMakeFiles/example.dir/test/example.c.o: CMakeFiles/example.dir/flags.make
CMakeFiles/example.dir/test/example.c.o: CMakeFiles/example.dir/includes_C.rsp
CMakeFiles/example.dir/test/example.c.o: D:/TPS_SSD/UE4-HTML5-TPS/HTML5_Build/BatchFiles/ThirdParty/zlib/zlib-1.2.8/test/example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\TPS_SSD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_O2\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/example.dir/test/example.c.o"
	D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\example.dir\test\example.c.o   -c D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\example.c

CMakeFiles/example.dir/test/example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example.dir/test/example.c.i"
	D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\example.c > CMakeFiles\example.dir\test\example.c.i

CMakeFiles/example.dir/test/example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example.dir/test/example.c.s"
	D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\emsdk\emsdk-1.39.0-fastcomp\fastcomp\emscripten\emcc.bat $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8\test\example.c -o CMakeFiles\example.dir\test\example.c.s

# Object files for target example
example_OBJECTS = \
"CMakeFiles/example.dir/test/example.c.o"

# External object files for target example
example_EXTERNAL_OBJECTS =

example.js: CMakeFiles/example.dir/test/example.c.o
example.js: CMakeFiles/example.dir/build.make
example.js: libz.bc
example.js: CMakeFiles/example.dir/linklibs.rsp
example.js: CMakeFiles/example.dir/objects1.rsp
example.js: CMakeFiles/example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\TPS_SSD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_O2\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable example.js"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\example.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/example.dir/build: example.js

.PHONY : CMakeFiles/example.dir/build

CMakeFiles/example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\example.dir\cmake_clean.cmake
.PHONY : CMakeFiles/example.dir/clean

CMakeFiles/example.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8 D:\TPS_SSD\UE4-HTML5-TPS\HTML5_Build\BatchFiles\ThirdParty\zlib\zlib-1.2.8 D:\TPS_SSD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_O2 D:\TPS_SSD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_O2 D:\TPS_SSD\UE4-HTML5-TPS\Intermediate\1.39.0-fc-mt\zlib-1.2.8\BUILD_O2\CMakeFiles\example.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/example.dir/depend

