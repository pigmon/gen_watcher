# Install script for directory: /home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/monitor_py/msg" TYPE FILE FILES
    "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg"
    "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg"
    "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg"
    "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/monitor_py/cmake" TYPE FILE FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/build/gen_watcher/catkin_generated/installspace/monitor_py-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/devel/include/monitor_py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/devel/share/roseus/ros/monitor_py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/devel/share/common-lisp/ros/monitor_py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/devel/share/gennodejs/ros/monitor_py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/devel/lib/python2.7/dist-packages/monitor_py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/devel/lib/python2.7/dist-packages/monitor_py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/build/gen_watcher/catkin_generated/installspace/monitor_py.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/monitor_py/cmake" TYPE FILE FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/build/gen_watcher/catkin_generated/installspace/monitor_py-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/monitor_py/cmake" TYPE FILE FILES
    "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/build/gen_watcher/catkin_generated/installspace/monitor_pyConfig.cmake"
    "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/build/gen_watcher/catkin_generated/installspace/monitor_pyConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/monitor_py" TYPE FILE FILES "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/package.xml")
endif()

