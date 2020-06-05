# CMake generated Testfile for 
# Source directory: /home/yjw/Stereo-Reconstruction/opensfm/src
# Build directory: /home/yjw/Stereo-Reconstruction/cmake_build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(depthmap_test "depthmap_test")
subdirs(third_party/pybind11)
subdirs(third_party/akaze)
subdirs(third_party/vlfeat)
subdirs(foundation)
subdirs(bundle)
subdirs(dense)
subdirs(features)
subdirs(geometry)
subdirs(robust)
