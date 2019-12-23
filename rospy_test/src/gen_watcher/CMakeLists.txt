cmake_minimum_required(VERSION 2.8.3)
project(monitor_py)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
  gen_watcher_msgs
  nox_msgs
  traffic_light
  cam
)

link_directories (
	${catkin_LIBRARY_DIRS}
	"src/"
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  include
  "include/"
)

set(CMAKE_AUTOMOC ON)

catkin_package(
    CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
)

add_executable(test_sub src/test_sub.cpp)
add_dependencies(test_sub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_sub ${catkin_LIBRARIES})

add_executable(location_node src/location.cpp)
add_dependencies(location_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(location_node ${catkin_LIBRARIES})