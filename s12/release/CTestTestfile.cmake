# CMake generated Testfile for 
# Source directory: /home/nanmiao/Documents/Tutorial/cmake_tutorial/s12
# Build directory: /home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Runs "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release/Tutorial" "25")
set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;47;add_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;0;")
add_test(Usage "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release/Tutorial")
set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Usage:.*number" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;49;add_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;0;")
add_test(Comp4 "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release/Tutorial" "4")
set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "4 is 2" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;55;add_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;61;do_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;0;")
add_test(Comp9 "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release/Tutorial" "9")
set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "9 is 3" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;55;add_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;62;do_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;0;")
add_test(Comp25 "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release/Tutorial" "25")
set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;55;add_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;63;do_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;0;")
add_test(Comp-25 "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/release/Tutorial" "-25")
set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is [-nan|nan|0]" _BACKTRACE_TRIPLES "/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;55;add_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;64;do_test;/home/nanmiao/Documents/Tutorial/cmake_tutorial/s12/CMakeLists.txt;0;")
subdirs("MathFunctions")
