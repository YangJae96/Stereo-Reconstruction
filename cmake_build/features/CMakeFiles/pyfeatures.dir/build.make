# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/yjw/Stereo-Reconstruction/opensfm/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yjw/Stereo-Reconstruction/cmake_build

# Include any dependencies generated for this target.
include features/CMakeFiles/pyfeatures.dir/depend.make

# Include the progress variables for this target.
include features/CMakeFiles/pyfeatures.dir/progress.make

# Include the compile flags for this target's objects.
include features/CMakeFiles/pyfeatures.dir/flags.make

features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o: features/CMakeFiles/pyfeatures.dir/flags.make
features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o: /home/yjw/Stereo-Reconstruction/opensfm/src/features/python/pybind.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yjw/Stereo-Reconstruction/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o"
	cd /home/yjw/Stereo-Reconstruction/cmake_build/features && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pyfeatures.dir/python/pybind.cc.o -c /home/yjw/Stereo-Reconstruction/opensfm/src/features/python/pybind.cc

features/CMakeFiles/pyfeatures.dir/python/pybind.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pyfeatures.dir/python/pybind.cc.i"
	cd /home/yjw/Stereo-Reconstruction/cmake_build/features && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjw/Stereo-Reconstruction/opensfm/src/features/python/pybind.cc > CMakeFiles/pyfeatures.dir/python/pybind.cc.i

features/CMakeFiles/pyfeatures.dir/python/pybind.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pyfeatures.dir/python/pybind.cc.s"
	cd /home/yjw/Stereo-Reconstruction/cmake_build/features && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjw/Stereo-Reconstruction/opensfm/src/features/python/pybind.cc -o CMakeFiles/pyfeatures.dir/python/pybind.cc.s

features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.requires:

.PHONY : features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.requires

features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.provides: features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.requires
	$(MAKE) -f features/CMakeFiles/pyfeatures.dir/build.make features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.provides.build
.PHONY : features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.provides

features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.provides.build: features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o


# Object files for target pyfeatures
pyfeatures_OBJECTS = \
"CMakeFiles/pyfeatures.dir/python/pybind.cc.o"

# External object files for target pyfeatures
pyfeatures_EXTERNAL_OBJECTS =

/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: features/CMakeFiles/pyfeatures.dir/build.make
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: features/libfeatures.a
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: foundation/libfoundation.a
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: third_party/akaze/libakaze.a
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/lib/x86_64-linux-gnu/libgflags.so
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/lib/x86_64-linux-gnu/libglog.so
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_stitching.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_ml.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_gapi.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_objdetect.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_highgui.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_videoio.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_photo.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_video.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_dnn.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_calib3d.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_features2d.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_flann.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_imgcodecs.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_imgproc.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: /usr/local/lib/libopencv_core.so.4.1.2
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: third_party/vlfeat/libvl.a
/home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so: features/CMakeFiles/pyfeatures.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yjw/Stereo-Reconstruction/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module /home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so"
	cd /home/yjw/Stereo-Reconstruction/cmake_build/features && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pyfeatures.dir/link.txt --verbose=$(VERBOSE)
	cd /home/yjw/Stereo-Reconstruction/cmake_build/features && /usr/bin/strip /home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
features/CMakeFiles/pyfeatures.dir/build: /home/yjw/Stereo-Reconstruction/opensfm/pyfeatures.cpython-36m-x86_64-linux-gnu.so

.PHONY : features/CMakeFiles/pyfeatures.dir/build

features/CMakeFiles/pyfeatures.dir/requires: features/CMakeFiles/pyfeatures.dir/python/pybind.cc.o.requires

.PHONY : features/CMakeFiles/pyfeatures.dir/requires

features/CMakeFiles/pyfeatures.dir/clean:
	cd /home/yjw/Stereo-Reconstruction/cmake_build/features && $(CMAKE_COMMAND) -P CMakeFiles/pyfeatures.dir/cmake_clean.cmake
.PHONY : features/CMakeFiles/pyfeatures.dir/clean

features/CMakeFiles/pyfeatures.dir/depend:
	cd /home/yjw/Stereo-Reconstruction/cmake_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjw/Stereo-Reconstruction/opensfm/src /home/yjw/Stereo-Reconstruction/opensfm/src/features /home/yjw/Stereo-Reconstruction/cmake_build /home/yjw/Stereo-Reconstruction/cmake_build/features /home/yjw/Stereo-Reconstruction/cmake_build/features/CMakeFiles/pyfeatures.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : features/CMakeFiles/pyfeatures.dir/depend

