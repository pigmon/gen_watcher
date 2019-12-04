;; Auto-generated. Do not edit!


(when (boundp 'monitor_py::info)
  (if (not (find-package "MONITOR_PY"))
    (make-package "MONITOR_PY"))
  (shadow 'info (find-package "MONITOR_PY")))
(unless (find-package "MONITOR_PY::INFO")
  (make-package "MONITOR_PY::INFO"))

(in-package "ROS")
;;//! \htmlinclude info.msg.html


(defclass monitor_py::info
  :super ros::object
  :slots (_fnum ))

(defmethod monitor_py::info
  (:init
   (&key
    ((:fnum __fnum) 0.0)
    )
   (send-super :init)
   (setq _fnum (float __fnum))
   self)
  (:fnum
   (&optional __fnum)
   (if __fnum (setq _fnum __fnum)) _fnum)
  (:serialization-length
   ()
   (+
    ;; float64 _fnum
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _fnum
       (sys::poke _fnum (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _fnum
     (setq _fnum (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get monitor_py::info :md5sum-) "cce30792a39fb76bc5361a9e6d6ed985")
(setf (get monitor_py::info :datatype-) "monitor_py/info")
(setf (get monitor_py::info :definition-)
      "float64 fnum
")



(provide :monitor_py/info "cce30792a39fb76bc5361a9e6d6ed985")


