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
include bundle/CMakeFiles/bundle.dir/depend.make

# Include the progress variables for this target.
include bundle/CMakeFiles/bundle.dir/progress.make

# Include the compile flags for this target's objects.
include bundle/CMakeFiles/bundle.dir/flags.make

bundle/CMakeFiles/bundle.dir/src/bundle_adjuster.cc.o: bundle/CMakeFiles/bundle.dir/flags.make
bundle/CMakeFiles/bundle.dir/src/bundle_adjuster.cc.o: /home/yjw/Stereo\ Reconstruction/opensfm/src/bundle/src/bundle_adjuster.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object bundle/CMakeFiles/bundle.dir/src/bundle_adjuster.cc.o"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/bundle" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bundle.dir/src/bundle_adjuster.cc.o -c "/home/yjw/Stereo Reconstruction/opensfm/src/bundle/src/bundle_adjuster.cc"

bundle/CMakeFiles/bundle.dir/src/bundle_adjuster.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bundle.dir/src/bundle_adjuster.cc.i"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/bundle" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/yjw/Stereo Reconstruction/opensfm/src/bundle/src/bundle_adjuster.cc" > CMakeFiles/bundle.dir/src/bundle_adjuster.cc.i

bundle/CMakeFiles/bundle.dir/src/bundle_adjuster.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bundle.dir/src/bundle_adjuster.cc.s"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/bundle" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/yjw/Stereo Reconstruction/opensfm/src/bundle/src/bundle_adjuster.cc" -o CMakeFiles/bundle.dir/src/bundle_adjuster.cc.s

# Object files for target bundle
bundle_OBJECTS = \
"CMakeFiles/bundle.dir/src/bundle_adjuster.cc.o"

# External object files for target bundle
bundle_EXTERNAL_OBJECTS =

bundle/libbundle.a: bundle/CMakeFiles/bundle.dir/src/bundle_adjuster.cc.o
bundle/libbundle.a: bundle/CMakeFiles/bundle.dir/build.make
bundle/libbundle.a: bundle/CMakeFiles/bundle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libbundle.a"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/bundle" && $(CMAKE_COMMAND) -P CMakeFiles/bundle.dir/cmake_clean_target.cmake
	cd "/home/yjw/Stereo Reconstruction/cmake_build/bundle" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bundle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
bundle/CMakeFiles/bundle.dir/build: bundle/libbundle.a

.PHONY : bundle/CMakeFiles/bundle.dir/build

bundle/CMakeFiles/bundle.dir/clean:
	cd "/home/yjw/Stereo Reconstruction/cmake_build/bundle" && $(CMAKE_COMMAND) -P CMakeFiles/bundle.dir/cmake_clean.cmake
.PHONY : bundle/CMakeFiles/bundle.dir/clean

bundle/CMakeFiles/bundle.dir/depend:
	cd "/home/yjw/Stereo Reconstruction/cmake_build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/yjw/Stereo Reconstruction/opensfm/src" "/home/yjw/Stereo Reconstruction/opensfm/src/bundle" "/home/yjw/Stereo Reconstruction/cmake_build" "/home/yjw/Stereo Reconstruction/cmake_build/bundle" "/home/yjw/Stereo Reconstruction/cmake_build/bundle/CMakeFiles/bundle.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : bundle/CMakeFiles/bundle.dir/depend

