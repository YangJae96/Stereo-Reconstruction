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
CMAKE_SOURCE_DIR = /home/yjw/KMU_SLAM/opensfm/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yjw/KMU_SLAM/cmake_build

# Include any dependencies generated for this target.
include third_party/akaze/CMakeFiles/akaze.dir/depend.make

# Include the progress variables for this target.
include third_party/akaze/CMakeFiles/akaze.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/akaze/CMakeFiles/akaze.dir/flags.make

third_party/akaze/CMakeFiles/akaze.dir/lib/AKAZE.cpp.o: third_party/akaze/CMakeFiles/akaze.dir/flags.make
third_party/akaze/CMakeFiles/akaze.dir/lib/AKAZE.cpp.o: /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/AKAZE.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yjw/KMU_SLAM/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object third_party/akaze/CMakeFiles/akaze.dir/lib/AKAZE.cpp.o"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/akaze.dir/lib/AKAZE.cpp.o -c /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/AKAZE.cpp

third_party/akaze/CMakeFiles/akaze.dir/lib/AKAZE.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/akaze.dir/lib/AKAZE.cpp.i"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/AKAZE.cpp > CMakeFiles/akaze.dir/lib/AKAZE.cpp.i

third_party/akaze/CMakeFiles/akaze.dir/lib/AKAZE.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/akaze.dir/lib/AKAZE.cpp.s"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/AKAZE.cpp -o CMakeFiles/akaze.dir/lib/AKAZE.cpp.s

third_party/akaze/CMakeFiles/akaze.dir/lib/fed.cpp.o: third_party/akaze/CMakeFiles/akaze.dir/flags.make
third_party/akaze/CMakeFiles/akaze.dir/lib/fed.cpp.o: /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/fed.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yjw/KMU_SLAM/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object third_party/akaze/CMakeFiles/akaze.dir/lib/fed.cpp.o"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/akaze.dir/lib/fed.cpp.o -c /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/fed.cpp

third_party/akaze/CMakeFiles/akaze.dir/lib/fed.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/akaze.dir/lib/fed.cpp.i"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/fed.cpp > CMakeFiles/akaze.dir/lib/fed.cpp.i

third_party/akaze/CMakeFiles/akaze.dir/lib/fed.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/akaze.dir/lib/fed.cpp.s"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/fed.cpp -o CMakeFiles/akaze.dir/lib/fed.cpp.s

third_party/akaze/CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.o: third_party/akaze/CMakeFiles/akaze.dir/flags.make
third_party/akaze/CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.o: /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/nldiffusion_functions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yjw/KMU_SLAM/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object third_party/akaze/CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.o"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.o -c /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/nldiffusion_functions.cpp

third_party/akaze/CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.i"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/nldiffusion_functions.cpp > CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.i

third_party/akaze/CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.s"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/nldiffusion_functions.cpp -o CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.s

third_party/akaze/CMakeFiles/akaze.dir/lib/utils.cpp.o: third_party/akaze/CMakeFiles/akaze.dir/flags.make
third_party/akaze/CMakeFiles/akaze.dir/lib/utils.cpp.o: /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yjw/KMU_SLAM/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object third_party/akaze/CMakeFiles/akaze.dir/lib/utils.cpp.o"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/akaze.dir/lib/utils.cpp.o -c /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/utils.cpp

third_party/akaze/CMakeFiles/akaze.dir/lib/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/akaze.dir/lib/utils.cpp.i"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/utils.cpp > CMakeFiles/akaze.dir/lib/utils.cpp.i

third_party/akaze/CMakeFiles/akaze.dir/lib/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/akaze.dir/lib/utils.cpp.s"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze/lib/utils.cpp -o CMakeFiles/akaze.dir/lib/utils.cpp.s

# Object files for target akaze
akaze_OBJECTS = \
"CMakeFiles/akaze.dir/lib/AKAZE.cpp.o" \
"CMakeFiles/akaze.dir/lib/fed.cpp.o" \
"CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.o" \
"CMakeFiles/akaze.dir/lib/utils.cpp.o"

# External object files for target akaze
akaze_EXTERNAL_OBJECTS =

third_party/akaze/libakaze.a: third_party/akaze/CMakeFiles/akaze.dir/lib/AKAZE.cpp.o
third_party/akaze/libakaze.a: third_party/akaze/CMakeFiles/akaze.dir/lib/fed.cpp.o
third_party/akaze/libakaze.a: third_party/akaze/CMakeFiles/akaze.dir/lib/nldiffusion_functions.cpp.o
third_party/akaze/libakaze.a: third_party/akaze/CMakeFiles/akaze.dir/lib/utils.cpp.o
third_party/akaze/libakaze.a: third_party/akaze/CMakeFiles/akaze.dir/build.make
third_party/akaze/libakaze.a: third_party/akaze/CMakeFiles/akaze.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yjw/KMU_SLAM/cmake_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libakaze.a"
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && $(CMAKE_COMMAND) -P CMakeFiles/akaze.dir/cmake_clean_target.cmake
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/akaze.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
third_party/akaze/CMakeFiles/akaze.dir/build: third_party/akaze/libakaze.a

.PHONY : third_party/akaze/CMakeFiles/akaze.dir/build

third_party/akaze/CMakeFiles/akaze.dir/clean:
	cd /home/yjw/KMU_SLAM/cmake_build/third_party/akaze && $(CMAKE_COMMAND) -P CMakeFiles/akaze.dir/cmake_clean.cmake
.PHONY : third_party/akaze/CMakeFiles/akaze.dir/clean

third_party/akaze/CMakeFiles/akaze.dir/depend:
	cd /home/yjw/KMU_SLAM/cmake_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yjw/KMU_SLAM/opensfm/src /home/yjw/KMU_SLAM/opensfm/src/third_party/akaze /home/yjw/KMU_SLAM/cmake_build /home/yjw/KMU_SLAM/cmake_build/third_party/akaze /home/yjw/KMU_SLAM/cmake_build/third_party/akaze/CMakeFiles/akaze.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : third_party/akaze/CMakeFiles/akaze.dir/depend

