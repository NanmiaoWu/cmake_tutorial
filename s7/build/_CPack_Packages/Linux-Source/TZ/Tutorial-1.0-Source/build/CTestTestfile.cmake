# CMake generated Testfile for 
# Source directory: /home/nanmiao/Documents/cmake_tutorial/s7
# Build directory: /home/nanmiao/Documents/cmake_tutorial/s7/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Runs "/home/nanmiao/Documents/cmake_tutorial/s7/build/Tutorial" "25")
set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;32;add_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;0;")
add_test(Usage "/home/nanmiao/Documents/cmake_tutorial/s7/build/Tutorial")
set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;34;add_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;0;")
add_test(Comp4 "/home/nanmiao/Documents/cmake_tutorial/s7/build/Tutorial" "4")
set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;40;add_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;46;do_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;0;")
add_test(Comp9 "/home/nanmiao/Documents/cmake_tutorial/s7/build/Tutorial" "9")
set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;40;add_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;47;do_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;0;")
add_test(Comp25 "/home/nanmiao/Documents/cmake_tutorial/s7/build/Tutorial" "25")
set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;40;add_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;48;do_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;0;")
add_test(Comp-25 "/home/nanmiao/Documents/cmake_tutorial/s7/build/Tutorial" "-25")
set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is [-nan|nan|0]" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;40;add_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;49;do_test;/home/nanmiao/Documents/cmake_tutorial/s7/CMakeLists.txt;0;")
subdirs("MathFunctions")
