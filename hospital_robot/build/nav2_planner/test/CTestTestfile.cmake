# CMake generated Testfile for 
# Source directory: /home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_planner/test
# Build directory: /home/huuhoa/hospital_robot/build/nav2_planner/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_dynamic_parameters "/usr/bin/python3" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/huuhoa/hospital_robot/build/nav2_planner/test_results/nav2_planner/test_dynamic_parameters.gtest.xml" "--package-name" "nav2_planner" "--output-file" "/home/huuhoa/hospital_robot/build/nav2_planner/ament_cmake_gtest/test_dynamic_parameters.txt" "--command" "/home/huuhoa/hospital_robot/build/nav2_planner/test/test_dynamic_parameters" "--gtest_output=xml:/home/huuhoa/hospital_robot/build/nav2_planner/test_results/nav2_planner/test_dynamic_parameters.gtest.xml")
set_tests_properties(test_dynamic_parameters PROPERTIES  LABELS "gtest" REQUIRED_FILES "/home/huuhoa/hospital_robot/build/nav2_planner/test/test_dynamic_parameters" TIMEOUT "60" WORKING_DIRECTORY "/home/huuhoa/hospital_robot/build/nav2_planner/test" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest_test.cmake;86;ament_add_test;/opt/ros/humble/share/ament_cmake_gtest/cmake/ament_add_gtest.cmake;93;ament_add_gtest_test;/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_planner/test/CMakeLists.txt;2;ament_add_gtest;/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_planner/test/CMakeLists.txt;0;")
subdirs("../gtest")
