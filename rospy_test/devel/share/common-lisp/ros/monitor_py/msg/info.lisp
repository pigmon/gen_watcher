; Auto-generated. Do not edit!


(cl:in-package monitor_py-msg)


;//! \htmlinclude info.msg.html

(cl:defclass <info> (roslisp-msg-protocol:ros-message)
  ((fnum
    :reader fnum
    :initarg :fnum
    :type cl:float
    :initform 0.0))
)

(cl:defclass info (<info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name monitor_py-msg:<info> is deprecated: use monitor_py-msg:info instead.")))

(cl:ensure-generic-function 'fnum-val :lambda-list '(m))
(cl:defmethod fnum-val ((m <info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader monitor_py-msg:fnum-val is deprecated.  Use monitor_py-msg:fnum instead.")
  (fnum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <info>) ostream)
  "Serializes a message object of type '<info>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'fnum))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <info>) istream)
  "Deserializes a message object of type '<info>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fnum) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<info>)))
  "Returns string type for a message object of type '<info>"
  "monitor_py/info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'info)))
  "Returns string type for a message object of type 'info"
  "monitor_py/info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<info>)))
  "Returns md5sum for a message object of type '<info>"
  "cce30792a39fb76bc5361a9e6d6ed985")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'info)))
  "Returns md5sum for a message object of type 'info"
  "cce30792a39fb76bc5361a9e6d6ed985")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<info>)))
  "Returns full string definition for message of type '<info>"
  (cl:format cl:nil "float64 fnum~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'info)))
  "Returns full string definition for message of type 'info"
  (cl:format cl:nil "float64 fnum~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <info>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <info>))
  "Converts a ROS message object to a list"
  (cl:list 'info
    (cl:cons ':fnum (fnum msg))
))
