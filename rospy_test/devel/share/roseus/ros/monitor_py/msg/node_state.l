;; Auto-generated. Do not edit!


(when (boundp 'monitor_py::node_state)
  (if (not (find-package "MONITOR_PY"))
    (make-package "MONITOR_PY"))
  (shadow 'node_state (find-package "MONITOR_PY")))
(unless (find-package "MONITOR_PY::NODE_STATE")
  (make-package "MONITOR_PY::NODE_STATE"))

(in-package "ROS")
;;//! \htmlinclude node_state.msg.html


(defclass monitor_py::node_state
  :super ros::object
  :slots (_msg_name _hz _hz_min _hz_max _param_name _param_value _param_min _param_max ))

(defmethod monitor_py::node_state
  (:init
   (&key
    ((:msg_name __msg_name) "")
    ((:hz __hz) 0.0)
    ((:hz_min __hz_min) 0.0)
    ((:hz_max __hz_max) 0.0)
    ((:param_name __param_name) "")
    ((:param_value __param_value) 0.0)
    ((:param_min __param_min) 0.0)
    ((:param_max __param_max) 0.0)
    )
   (send-super :init)
   (setq _msg_name (string __msg_name))
   (setq _hz (float __hz))
   (setq _hz_min (float __hz_min))
   (setq _hz_max (float __hz_max))
   (setq _param_name (string __param_name))
   (setq _param_value (float __param_value))
   (setq _param_min (float __param_min))
   (setq _param_max (float __param_max))
   self)
  (:msg_name
   (&optional __msg_name)
   (if __msg_name (setq _msg_name __msg_name)) _msg_name)
  (:hz
   (&optional __hz)
   (if __hz (setq _hz __hz)) _hz)
  (:hz_min
   (&optional __hz_min)
   (if __hz_min (setq _hz_min __hz_min)) _hz_min)
  (:hz_max
   (&optional __hz_max)
   (if __hz_max (setq _hz_max __hz_max)) _hz_max)
  (:param_name
   (&optional __param_name)
   (if __param_name (setq _param_name __param_name)) _param_name)
  (:param_value
   (&optional __param_value)
   (if __param_value (setq _param_value __param_value)) _param_value)
  (:param_min
   (&optional __param_min)
   (if __param_min (setq _param_min __param_min)) _param_min)
  (:param_max
   (&optional __param_max)
   (if __param_max (setq _param_max __param_max)) _param_max)
  (:serialization-length
   ()
   (+
    ;; string _msg_name
    4 (length _msg_name)
    ;; float64 _hz
    8
    ;; float64 _hz_min
    8
    ;; float64 _hz_max
    8
    ;; string _param_name
    4 (length _param_name)
    ;; float64 _param_value
    8
    ;; float64 _param_min
    8
    ;; float64 _param_max
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _msg_name
       (write-long (length _msg_name) s) (princ _msg_name s)
     ;; float64 _hz
       (sys::poke _hz (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _hz_min
       (sys::poke _hz_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _hz_max
       (sys::poke _hz_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _param_name
       (write-long (length _param_name) s) (princ _param_name s)
     ;; float64 _param_value
       (sys::poke _param_value (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _param_min
       (sys::poke _param_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _param_max
       (sys::poke _param_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _msg_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _msg_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _hz
     (setq _hz (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _hz_min
     (setq _hz_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _hz_max
     (setq _hz_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _param_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _param_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _param_value
     (setq _param_value (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _param_min
     (setq _param_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _param_max
     (setq _param_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get monitor_py::node_state :md5sum-) "d06aaa16cbeab11b30b8b7466c37381a")
(setf (get monitor_py::node_state :datatype-) "monitor_py/node_state")
(setf (get monitor_py::node_state :definition-)
      "# 一个监视消息的数据
string msg_name
float64 hz
float64 hz_min
float64 hz_max
string param_name
float64 param_value
float64 param_min
float64 param_max
")



(provide :monitor_py/node_state "d06aaa16cbeab11b30b8b7466c37381a")


