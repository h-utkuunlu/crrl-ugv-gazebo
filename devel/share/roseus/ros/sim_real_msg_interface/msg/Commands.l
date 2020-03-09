;; Auto-generated. Do not edit!


(when (boundp 'sim_real_msg_interface::Commands)
  (if (not (find-package "SIM_REAL_MSG_INTERFACE"))
    (make-package "SIM_REAL_MSG_INTERFACE"))
  (shadow 'Commands (find-package "SIM_REAL_MSG_INTERFACE")))
(unless (find-package "SIM_REAL_MSG_INTERFACE::COMMANDS")
  (make-package "SIM_REAL_MSG_INTERFACE::COMMANDS"))

(in-package "ROS")
;;//! \htmlinclude Commands.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sim_real_msg_interface::Commands
  :super ros::object
  :slots (_header _velocity _omega ))

(defmethod sim_real_msg_interface::Commands
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:velocity __velocity) 0.0)
    ((:omega __omega) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _velocity (float __velocity))
   (setq _omega (float __omega))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:omega
   (&optional __omega)
   (if __omega (setq _omega __omega)) _omega)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _velocity
    4
    ;; float32 _omega
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _omega
       (sys::poke _omega (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _omega
     (setq _omega (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sim_real_msg_interface::Commands :md5sum-) "b37d025bd24f9e3a7356e8eb85f42da7")
(setf (get sim_real_msg_interface::Commands :datatype-) "sim_real_msg_interface/Commands")
(setf (get sim_real_msg_interface::Commands :definition-)
      "std_msgs/Header header
float32 velocity
float32 omega
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
# 0: no frame
# 1: global frame
string frame_id

")



(provide :sim_real_msg_interface/Commands "b37d025bd24f9e3a7356e8eb85f42da7")


