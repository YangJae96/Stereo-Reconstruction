# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/yjw/Stereo Reconstruction/opensfm/src"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/yjw/Stereo Reconstruction/cmake_build"

# Include any dependencies generated for this target.
include foundation/CMakeFiles/foundation.dir/depend.make

# Include the progress variables for this target.
include foundation/CMakeFiles/foundation.dir/progress.make

# Include the compile flags for this target's objects.
include foundation/CMakeFiles/foundation.dir/flags.make

foundation/CMakeFiles/foundation.dir/src/types.cc.o: foundation/CMakeFiles/foundation.dir/flags.make
foundation/CMakeFiles/foundation.dir/src/types.cc.o: /home/yjw/Stereo\ Reconstruction/opensfm/src/foundation/src/types.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object foundation/CMakeFiles/foundation.dir/src/types.cc.o"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/foundation.dir/src/types.cc.o -c "/home/yjw/Stereo Reconstruction/opensfm/src/foundation/src/types.cc"

foundation/CMakeFiles/foundation.dir/src/types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/foundation.dir/src/types.cc.i"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/yjw/Stereo Reconstruction/opensfm/src/foundation/src/types.cc" > CMakeFiles/foundation.dir/src/types.cc.i

foundation/CMakeFiles/foundation.dir/src/types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/foundation.dir/src/types.cc.s"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/yjw/Stereo Reconstruction/opensfm/src/foundation/src/types.cc" -o CMakeFiles/foundation.dir/src/types.cc.s

foundation/CMakeFiles/foundation.dir/src/logger.cc.o: foundation/CMakeFiles/foundation.dir/flags.make
foundation/CMakeFiles/foundation.dir/src/logger.cc.o: /home/yjw/Stereo\ Reconstruction/opensfm/src/foundation/src/logger.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object foundation/CMakeFiles/foundation.dir/src/logger.cc.o"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/foundation.dir/src/logger.cc.o -c "/home/yjw/Stereo Reconstruction/opensfm/src/foundation/src/logger.cc"

foundation/CMakeFiles/foundation.dir/src/logger.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/foundation.dir/src/logger.cc.i"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/yjw/Stereo Reconstruction/opensfm/src/foundation/src/logger.cc" > CMakeFiles/foundation.dir/src/logger.cc.i

foundation/CMakeFiles/foundation.dir/src/logger.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/foundation.dir/src/logger.cc.s"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/yjw/Stereo Reconstruction/opensfm/src/foundation/src/logger.cc" -o CMakeFiles/foundation.dir/src/logger.cc.s

# Object files for target foundation
foundation_OBJECTS = \
"CMakeFiles/foundation.dir/src/types.cc.o" \
"CMakeFiles/foundation.dir/src/logger.cc.o"

# External object files for target foundation
foundation_EXTERNAL_OBJECTS =

foundation/libfoundation.a: foundation/CMakeFiles/foundation.dir/src/types.cc.o
foundation/libfoundation.a: foundation/CMakeFiles/foundation.dir/src/logger.cc.o
foundation/libfoundation.a: foundation/CMakeFiles/foundation.dir/build.make
foundation/libfoundation.a: foundation/CMakeFiles/foundation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libfoundation.a"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && $(CMAKE_COMMAND) -P CMakeFiles/foundation.dir/cmake_clean_target.cmake
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/foundation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
foundation/CMakeFiles/foundation.dir/build: foundation/libfoundation.a

.PHONY : foundation/CMakeFiles/foundation.dir/build

foundation/CMakeFiles/foundation.dir/clean:
	cd "/home/yjw/Stereo Reconstruction/cmake_build/foundation" && $(CMAKE_COMMAND) -P CMakeFiles/foundation.dir/cmake_clean.cmake
.PHONY : foundation/CMakeFiles/foundation.dir/clean

foundation/CMakeFiles/foundation.dir/depend:
	cd "/home/yjw/Stereo Reconstruction/cmake_build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/yjw/Stereo Reconstruction/opensfm/src" "/home/yjw/Stereo Reconstruction/opensfm/src/foundation" "/home/yjw/Stereo Reconstruction/cmake_build" "/home/yjw/Stereo Reconstruction/cmake_build/foundation" "/home/yjw/Stereo Reconstruction/cmake_build/foundation/CMakeFiles/foundation.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : foundation/CMakeFiles/foundation.dir/depend

