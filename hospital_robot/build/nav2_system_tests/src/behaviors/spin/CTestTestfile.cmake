# CMake generated Testfile for 
# Source directory: /home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin
# Build directory: /home/huuhoa/hospital_robot/build/nav2_system_tests/src/behaviors/spin
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_spin_behavior "/usr/bin/python3" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/huuhoa/hospital_robot/build/nav2_system_tests/test_results/nav2_system_tests/test_spin_behavior.xml" "--package-name" "nav2_system_tests" "--generate-result-on-success" "--env" "TEST_MAP=/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/maps/map_circular.yaml" "TEST_EXECUTABLE=/home/huuhoa/hospital_robot/build/nav2_system_tests/src/behaviors/spin/test_spin_behavior_node" "TEST_WORLD=/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/worlds/turtlebot3_ros2_demo.world" "GAZEBO_MODEL_PATH=/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/models" "BT_NAVIGATOR_XML=navigate_to_pose_w_replanning_and_recovery.xml" "--command" "/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin/test_spin_behavior_launch.py")
set_tests_properties(test_spin_behavior PROPERTIES  TIMEOUT "180" WORKING_DIRECTORY "/home/huuhoa/hospital_robot/build/nav2_system_tests/src/behaviors/spin" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin/CMakeLists.txt;12;ament_add_test;/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin/CMakeLists.txt;0;")
add_test(test_spin_behavior_fake "/usr/bin/python3" "-u" "/opt/ros/humble/share/ament_cmake_test/cmake/run_test.py" "/home/huuhoa/hospital_robot/build/nav2_system_tests/test_results/nav2_system_tests/test_spin_behavior_fake.xml" "--package-name" "nav2_system_tests" "--generate-result-on-success" "--env" "TEST_MAP=/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/maps/map_circular.yaml" "TEST_EXECUTABLE=/home/huuhoa/hospital_robot/build/nav2_system_tests/src/behaviors/spin/test_spin_behavior_node" "MAKE_FAKE_COSTMAP=true" "--command" "/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin/test_spin_behavior_fake_launch.py")
set_tests_properties(test_spin_behavior_fake PROPERTIES  TIMEOUT "180" WORKING_DIRECTORY "/home/huuhoa/hospital_robot/build/nav2_system_tests/src/behaviors/spin" _BACKTRACE_TRIPLES "/opt/ros/humble/share/ament_cmake_test/cmake/ament_add_test.cmake;125;add_test;/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin/CMakeLists.txt;25;ament_add_test;/home/huuhoa/hospital_robot/src/nav2_package/navigation2/nav2_system_tests/src/behaviors/spin/CMakeLists.txt;0;")
