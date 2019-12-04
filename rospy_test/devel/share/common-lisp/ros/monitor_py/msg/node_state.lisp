; Auto-generated. Do not edit!


(cl:in-package monitor_py-msg)


;//! \htmlinclude node_state.msg.html

(cl:defclass <node_state> (roslisp-msg-protocol:ros-message)
  ((msg_name
    :reader msg_name
    :initarg :msg_name
    :type cl:string
    :initform "")
   (hz
    :reader hz
    :initarg :hz
    :type cl:float
    :initform 0.0)
   (hz_min
    :reader hz_min
    :initarg :hz_min
    :type cl:float
    :initform 0.0)
   (hz_max
    :reader hz_max
    :initarg :hz_max
    :type cl:float
    :initform 0.0)
   (param_name
    :reader param_name
    :initarg :param_name
    :type cl:string
    :initform "")
   (param_value
    :reader param_value
    :initarg :param_value
    :type cl:float
    :initform 0.0)
   (param_min
    :reader param_min
    :initarg :param_min
    :type cl:float
    :initform 0.0)
   (param_max
    :reader param_max
    :initarg :param_max
    :type cl:float
    :initform 0.0))
)

(cl:defclass node_state (<node_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <node_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'node_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name monitor_py-msg:<node_state> is deprecated: use monitor_py-msg:node_state instead.")))

(cl:ensure-generic-function 'msg_name-val :lambda-list '(m))
(cl:defmethod msg_name-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:msg_name-val is deprecated.  Use monitor_py-msg:msg_name instead.")
  (msg_name m))

(cl:ensure-generic-function 'hz-val :lambda-list '(m))
(cl:defmethod hz-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:hz-val is deprecated.  Use monitor_py-msg:hz instead.")
  (hz m))

(cl:ensure-generic-function 'hz_min-val :lambda-list '(m))
(cl:defmethod hz_min-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:hz_min-val is deprecated.  Use monitor_py-msg:hz_min instead.")
  (hz_min m))

(cl:ensure-generic-function 'hz_max-val :lambda-list '(m))
(cl:defmethod hz_max-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:hz_max-val is deprecated.  Use monitor_py-msg:hz_max instead.")
  (hz_max m))

(cl:ensure-generic-function 'param_name-val :lambda-list '(m))
(cl:defmethod param_name-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:param_name-val is deprecated.  Use monitor_py-msg:param_name instead.")
  (param_name m))

(cl:ensure-generic-function 'param_value-val :lambda-list '(m))
(cl:defmethod param_value-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:param_value-val is deprecated.  Use monitor_py-msg:param_value instead.")
  (param_value m))

(cl:ensure-generic-function 'param_min-val :lambda-list '(m))
(cl:defmethod param_min-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:param_min-val is deprecated.  Use monitor_py-msg:param_min instead.")
  (param_min m))

(cl:ensure-generic-function 'param_max-val :lambda-list '(m))
(cl:defmethod param_max-val ((m <node_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:param_max-val is deprecated.  Use monitor_py-msg:param_max instead.")
  (param_max m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <node_state>) ostream)
  "Serializes a message object of type '<node_state>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'msg_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'msg_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hz_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'hz_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'param_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'param_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'param_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'param_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'param_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <node_state>) istream)
  "Deserializes a message object of type '<node_state>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'msg_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'msg_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hz) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hz_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hz_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'param_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'param_value) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'param_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'param_max) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<node_state>)))
  "Returns string type for a message object of type '<node_state>"
  "monitor_py/node_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'node_state)))
  "Returns string type for a message object of type 'node_state"
  "monitor_py/node_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<node_state>)))
  "Returns md5sum for a message object of type '<node_state>"
  "d06aaa16cbeab11b30b8b7466c37381a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'node_state)))
  "Returns md5sum for a message object of type 'node_state"
  "d06aaa16cbeab11b30b8b7466c37381a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<node_state>)))
  "Returns full string definition for message of type '<node_state>"
  (cl:format cl:nil "# 一个监视消息的数据~%string msg_name~%float64 hz~%float64 hz_min~%float64 hz_max~%string param_name~%float64 param_value~%float64 param_min~%float64 param_max~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'node_state)))
  "Returns full string definition for message of type 'node_state"
  (cl:format cl:nil "# 一个监视消息的数据~%string msg_name~%float64 hz~%float64 hz_min~%float64 hz_max~%string param_name~%float64 param_value~%float64 param_min~%float64 param_max~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <node_state>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'msg_name))
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'param_name))
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <node_state>))
  "Converts a ROS message object to a list"
  (cl:list 'node_state
    (cl:cons ':msg_name (msg_name msg))
    (cl:cons ':hz (hz msg))
    (cl:cons ':hz_min (hz_min msg))
    (cl:cons ':hz_max (hz_max msg))
    (cl:cons ':param_name (param_name msg))
    (cl:cons ':param_value (param_value msg))
    (cl:cons ':param_min (param_min msg))
    (cl:cons ':param_max (param_max msg))
))
