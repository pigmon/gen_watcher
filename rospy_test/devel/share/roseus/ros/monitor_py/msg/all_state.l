;; Auto-generated. Do not edit!


(when (boundp 'monitor_py::all_state)
  (if (not (find-package "MONITOR_PY"))
    (make-package "MONITOR_PY"))
  (shadow 'all_state (find-package "MONITOR_PY")))
(unless (find-package "MONITOR_PY::ALL_STATE")
  (make-package "MONITOR_PY::ALL_STATE"))

(in-package "ROS")
;;//! \htmlinclude all_state.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass monitor_py::all_state
  :super ros::object
  :slots (_header _states ))

(defmethod monitor_py::all_state
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:states __states) (let (r) (dotimes (i 0) (push (instance monitor_py::node_state :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _states __states)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:states
   (&rest __states)
   (if (keywordp (car __states))
       (send* _states __states)
     (progn
       (if __states (setq _states (car __states)))
       _states)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; monitor_py/node_state[] _states
    (apply #'+ (send-all _states :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; monitor_py/node_state[] _states
     (write-long (length _states) s)
     (dolist (elem _states)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; monitor_py/node_state[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (let (r) (dotimes (i n) (push (instance monitor_py::node_state :init) r)) r))
     (dolist (elem- _states)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get monitor_py::all_state :md5sum-) "5e8e92ac40aa34df2551f0b3df24250d")
(setf (get monitor_py::all_state :datatype-) "monitor_py/all_state")
(setf (get monitor_py::all_state :definition-)
      "# 所有监控消息
Header header
node_state[] states
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: monitor_py/node_state
# 一个监视消息的数据
string msg_name
float64 hz
float64 hz_min
float64 hz_max
string param_name
float64 param_value
float64 param_min
float64 param_max
")



(provide :monitor_py/all_state "5e8e92ac40aa34df2551f0b3df24250d")


