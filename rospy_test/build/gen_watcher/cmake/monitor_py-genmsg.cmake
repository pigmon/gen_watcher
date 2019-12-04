# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "monitor_py: 4 messages, 0 services")

set(MSG_I_FLAGS "-Imonitor_py:/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(monitor_py_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" NAME_WE)
add_custom_target(_monitor_py_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "monitor_py" "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" ""
)

get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" NAME_WE)
add_custom_target(_monitor_py_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "monitor_py" "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" "monitor_py/node_state:std_msgs/Header"
)

get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" NAME_WE)
add_custom_target(_monitor_py_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "monitor_py" "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" ""
)

get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" NAME_WE)
add_custom_target(_monitor_py_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "monitor_py" "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py
)
_generate_msg_cpp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg"
  "${MSG_I_FLAGS}"
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py
)
_generate_msg_cpp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py
)
_generate_msg_cpp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py
)

### Generating Services

### Generating Module File
_generate_module_cpp(monitor_py
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(monitor_py_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(monitor_py_generate_messages monitor_py_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_cpp _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_cpp _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_cpp _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_cpp _monitor_py_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(monitor_py_gencpp)
add_dependencies(monitor_py_gencpp monitor_py_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS monitor_py_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py
)
_generate_msg_eus(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg"
  "${MSG_I_FLAGS}"
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py
)
_generate_msg_eus(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py
)
_generate_msg_eus(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py
)

### Generating Services

### Generating Module File
_generate_module_eus(monitor_py
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(monitor_py_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(monitor_py_generate_messages monitor_py_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_eus _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_eus _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_eus _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_eus _monitor_py_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(monitor_py_geneus)
add_dependencies(monitor_py_geneus monitor_py_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS monitor_py_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py
)
_generate_msg_lisp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg"
  "${MSG_I_FLAGS}"
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py
)
_generate_msg_lisp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py
)
_generate_msg_lisp(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py
)

### Generating Services

### Generating Module File
_generate_module_lisp(monitor_py
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(monitor_py_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(monitor_py_generate_messages monitor_py_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_lisp _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_lisp _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_lisp _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_lisp _monitor_py_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(monitor_py_genlisp)
add_dependencies(monitor_py_genlisp monitor_py_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS monitor_py_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py
)
_generate_msg_nodejs(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg"
  "${MSG_I_FLAGS}"
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py
)
_generate_msg_nodejs(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py
)
_generate_msg_nodejs(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py
)

### Generating Services

### Generating Module File
_generate_module_nodejs(monitor_py
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(monitor_py_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(monitor_py_generate_messages monitor_py_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_nodejs _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_nodejs _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_nodejs _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_nodejs _monitor_py_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(monitor_py_gennodejs)
add_dependencies(monitor_py_gennodejs monitor_py_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS monitor_py_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py
)
_generate_msg_py(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg"
  "${MSG_I_FLAGS}"
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py
)
_generate_msg_py(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py
)
_generate_msg_py(monitor_py
  "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py
)

### Generating Services

### Generating Module File
_generate_module_py(monitor_py
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(monitor_py_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(monitor_py_generate_messages monitor_py_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/info.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_py _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/all_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_py _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/node_state.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_py _monitor_py_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pigmon/Workspace/Beiqi/gen_watcher/rospy_test/src/gen_watcher/msg/Num.msg" NAME_WE)
add_dependencies(monitor_py_generate_messages_py _monitor_py_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(monitor_py_genpy)
add_dependencies(monitor_py_genpy monitor_py_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS monitor_py_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/monitor_py
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(monitor_py_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/monitor_py
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(monitor_py_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/monitor_py
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(monitor_py_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/monitor_py
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(monitor_py_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/monitor_py
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(monitor_py_generate_messages_py std_msgs_generate_messages_py)
endif()
