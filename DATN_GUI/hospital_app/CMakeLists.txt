cmake_minimum_required(VERSION 3.5)
project(hospital_app LANGUAGES CXX)

#set(CMAKE_PREFIX_PATH "/home/namlee/Qt5.12.8/5.12.8/gcc_64")

# Set CMake variables
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find Qt5
#find_package(Qt5 COMPONENTS Core Quick Widgets Network VirtualKeyboard REQUIRED)
find_package(Qt5 COMPONENTS Core Quick Widgets Network REQUIRED)

## Find ROS2 and ament_cmake
#find_package(ament_cmake REQUIRED)
#find_package(rclcpp REQUIRED)
#find_package(geometry_msgs REQUIRED)
#find_package(std_msgs REQUIRED)
#find_package(builtin_interfaces REQUIRED)
#find_package(rosidl_typesupport_c REQUIRED)

# List UI files
set(PROJECT_UIS
    chatitemwidget.ui
    mainwindow.ui
)

# List source files
set(PROJECT_SOURCES
    main.cpp
    chatitemwidget.cpp
    chatitemwidget.h
    chatprotocol.cpp
    chatprotocol.h
    chatwindowlauncher.cpp
    chatwindowlauncher.h
    mainwindow.cpp
    mainwindow.h
    ui_chatitemwidget.h
    ui_mainwindow.h
    clientmanager.cpp
    clientmanager.h
    lightcontroller.cpp
    lightcontroller.h
    NavigationSender.cpp
    NavigationSender.h
    qml.qrc
)

# Create executable
add_executable(hospital_app ${PROJECT_SOURCES} ${PROJECT_UIS})

# Link Qt5 and ROS2 libraries
#ament_target_dependencies(hospital_app
#    PUBLIC
#    rclcpp
#    geometry_msgs
#    std_msgs
#    builtin_interfaces
#    rosidl_typesupport_c
#)
target_link_libraries(hospital_app
    PRIVATE
    Qt5::Core
    Qt5::Quick
    Qt5::Widgets
    Qt5::Network
#    Qt5::VirtualKeyboard
)

# Define debug for QML
target_compile_definitions(hospital_app
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

# Install the executable
install(TARGETS hospital_app
    DESTINATION lib/${PROJECT_NAME}
)

# Install ament package
#ament_package()
