cmake_minimum_required(VERSION 2.8.3)
project(rospy_test)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS 
  roscpp
  rospy
  std_msgs
  message_generation
)

link_directories (
	${catkin_LIBRARY_DIRS} 
	"lib/" 
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
)

generate_messages(
  DEPENDENCIES
  std_msgs 
)

catkin_package(
    CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
)
