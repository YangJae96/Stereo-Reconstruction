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
include geometry/CMakeFiles/pygeometry.dir/depend.make

# Include the progress variables for this target.
include geometry/CMakeFiles/pygeometry.dir/progress.make

# Include the compile flags for this target's objects.
include geometry/CMakeFiles/pygeometry.dir/flags.make

geometry/CMakeFiles/pygeometry.dir/python/pybind.cc.o: geometry/CMakeFiles/pygeometry.dir/flags.make
geometry/CMakeFiles/pygeometry.dir/python/pybind.cc.o: /home/yjw/Stereo\ Reconstruction/opensfm/src/geometry/python/pybind.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object geometry/CMakeFiles/pygeometry.dir/python/pybind.cc.o"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/geometry" && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pygeometry.dir/python/pybind.cc.o -c "/home/yjw/Stereo Reconstruction/opensfm/src/geometry/python/pybind.cc"

geometry/CMakeFiles/pygeometry.dir/python/pybind.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pygeometry.dir/python/pybind.cc.i"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/geometry" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/yjw/Stereo Reconstruction/opensfm/src/geometry/python/pybind.cc" > CMakeFiles/pygeometry.dir/python/pybind.cc.i

geometry/CMakeFiles/pygeometry.dir/python/pybind.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pygeometry.dir/python/pybind.cc.s"
	cd "/home/yjw/Stereo Reconstruction/cmake_build/geometry" && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/yjw/Stereo Reconstruction/opensfm/src/geometry/python/pybind.cc" -o CMakeFiles/pygeometry.dir/python/pybind.cc.s

# Object files for target pygeometry
pygeometry_OBJECTS = \
"CMakeFiles/pygeometry.dir/python/pybind.cc.o"

# External object files for target pygeometry
pygeometry_EXTERNAL_OBJECTS =

/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: geometry/CMakeFiles/pygeometry.dir/python/pybind.cc.o
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: geometry/CMakeFiles/pygeometry.dir/build.make
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: geometry/libgeometry.a
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: foundation/libfoundation.a
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_dnn.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_ml.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_objdetect.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_shape.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_stitching.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_superres.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_videostab.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_calib3d.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_features2d.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_flann.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_highgui.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_photo.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_video.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_videoio.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_imgcodecs.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_imgproc.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_core.so.3.4.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/lib/x86_64-linux-gnu/libgflags.so.2.2.2
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: /usr/lib/x86_64-linux-gnu/libglog.so
/home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so: geometry/CMakeFiles/pygeometry.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/yjw/Stereo Reconstruction/cmake_build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module \"/home/yjw/Stereo Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so\""
	cd "/home/yjw/Stereo Reconstruction/cmake_build/geometry" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pygeometry.dir/link.txt --verbose=$(VERBOSE)
	cd "/home/yjw/Stereo Reconstruction/cmake_build/geometry" && /usr/bin/strip /home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
geometry/CMakeFiles/pygeometry.dir/build: /home/yjw/Stereo\ Reconstruction/opensfm/pygeometry.cpython-37m-x86_64-linux-gnu.so

.PHONY : geometry/CMakeFiles/pygeometry.dir/build

geometry/CMakeFiles/pygeometry.dir/clean:
	cd "/home/yjw/Stereo Reconstruction/cmake_build/geometry" && $(CMAKE_COMMAND) -P CMakeFiles/pygeometry.dir/cmake_clean.cmake
.PHONY : geometry/CMakeFiles/pygeometry.dir/clean

geometry/CMakeFiles/pygeometry.dir/depend:
	cd "/home/yjw/Stereo Reconstruction/cmake_build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/yjw/Stereo Reconstruction/opensfm/src" "/home/yjw/Stereo Reconstruction/opensfm/src/geometry" "/home/yjw/Stereo Reconstruction/cmake_build" "/home/yjw/Stereo Reconstruction/cmake_build/geometry" "/home/yjw/Stereo Reconstruction/cmake_build/geometry/CMakeFiles/pygeometry.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : geometry/CMakeFiles/pygeometry.dir/depend

