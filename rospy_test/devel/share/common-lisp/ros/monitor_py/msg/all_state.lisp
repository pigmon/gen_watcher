; Auto-generated. Do not edit!


(cl:in-package monitor_py-msg)


;//! \htmlinclude all_state.msg.html

(cl:defclass <all_state> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (states
    :reader states
    :initarg :states
    :type (cl:vector monitor_py-msg:node_state)
   :initform (cl:make-array 0 :element-type 'monitor_py-msg:node_state :initial-element (cl:make-instance 'monitor_py-msg:node_state))))
)

(cl:defclass all_state (<all_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <all_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'all_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name monitor_py-msg:<all_state> is deprecated: use monitor_py-msg:all_state instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <all_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:header-val is deprecated.  Use monitor_py-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'states-val :lambda-list '(m))
(cl:defmethod states-val ((m <all_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:states-val is deprecated.  Use monitor_py-msg:states instead.")
  (states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <all_state>) ostream)
  "Serializes a message object of type '<all_state>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <all_state>) istream)
  "Deserializes a message object of type '<all_state>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'monitor_py-msg:node_state))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<all_state>)))
  "Returns string type for a message object of type '<all_state>"
  "monitor_py/all_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'all_state)))
  "Returns string type for a message object of type 'all_state"
  "monitor_py/all_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<all_state>)))
  "Returns md5sum for a message object of type '<all_state>"
  "5e8e92ac40aa34df2551f0b3df24250d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'all_state)))
  "Returns md5sum for a message object of type 'all_state"
  "5e8e92ac40aa34df2551f0b3df24250d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<all_state>)))
  "Returns full string definition for message of type '<all_state>"
  (cl:format cl:nil "# 所有监控消息~%Header header~%node_state[] states~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: monitor_py/node_state~%# 一个监视消息的数据~%string msg_name~%float64 hz~%float64 hz_min~%float64 hz_max~%string param_name~%float64 param_value~%float64 param_min~%float64 param_max~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'all_state)))
  "Returns full string definition for message of type 'all_state"
  (cl:format cl:nil "# 所有监控消息~%Header header~%node_state[] states~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: monitor_py/node_state~%# 一个监视消息的数据~%string msg_name~%float64 hz~%float64 hz_min~%float64 hz_max~%string param_name~%float64 param_value~%float64 param_min~%float64 param_max~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <all_state>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <all_state>))
  "Converts a ROS message object to a list"
  (cl:list 'all_state
    (cl:cons ':header (header msg))
    (cl:cons ':states (states msg))
))
