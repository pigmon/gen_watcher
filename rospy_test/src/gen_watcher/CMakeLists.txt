cmake_minimum_required(VERSION 2.8.3)
project(monitor_py)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS 
  roscpp
  rospy
  std_msgs
  message_generation
)

link_directories (
	${catkin_LIBRARY_DIRS} 
	"src/"
)

include_directories(
  ${catkin_INCLUDE_DIRS} 
  "include/"
)

set(CMAKE_AUTOMOC ON)

add_message_files(
  FILES
  Num.msg
  info.msg
  node_state.msg
  all_state.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs 
)

catkin_package(
    CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
)

add_executable(test_sub src/test_sub.cpp)
add_dependencies(test_sub ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_sub ${catkin_LIBRARIES})