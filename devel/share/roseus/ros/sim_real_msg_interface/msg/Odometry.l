;; Auto-generated. Do not edit!


(when (boundp 'sim_real_msg_interface::Odometry)
  (if (not (find-package "SIM_REAL_MSG_INTERFACE"))
    (make-package "SIM_REAL_MSG_INTERFACE"))
  (shadow 'Odometry (find-package "SIM_REAL_MSG_INTERFACE")))
(unless (find-package "SIM_REAL_MSG_INTERFACE::ODOMETRY")
  (make-package "SIM_REAL_MSG_INTERFACE::ODOMETRY"))

(in-package "ROS")
;;//! \htmlinclude Odometry.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sim_real_msg_interface::Odometry
  :super ros::object
  :slots (_header _ap_time _wheel_R _wheel_L _gyro _acc1 _acc2 _magn _velocity _omega ))

(defmethod sim_real_msg_interface::Odometry
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ap_time __ap_time) 0.0)
    ((:wheel_R __wheel_R) 0.0)
    ((:wheel_L __wheel_L) 0.0)
    ((:gyro __gyro) (instance geometry_msgs::Vector3 :init))
    ((:acc1 __acc1) (instance geometry_msgs::Vector3 :init))
    ((:acc2 __acc2) (instance geometry_msgs::Vector3 :init))
    ((:magn __magn) (instance geometry_msgs::Vector3 :init))
    ((:velocity __velocity) 0.0)
    ((:omega __omega) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _ap_time (float __ap_time))
   (setq _wheel_R (float __wheel_R))
   (setq _wheel_L (float __wheel_L))
   (setq _gyro __gyro)
   (setq _acc1 __acc1)
   (setq _acc2 __acc2)
   (setq _magn __magn)
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
  (:ap_time
   (&optional __ap_time)
   (if __ap_time (setq _ap_time __ap_time)) _ap_time)
  (:wheel_R
   (&optional __wheel_R)
   (if __wheel_R (setq _wheel_R __wheel_R)) _wheel_R)
  (:wheel_L
   (&optional __wheel_L)
   (if __wheel_L (setq _wheel_L __wheel_L)) _wheel_L)
  (:gyro
   (&rest __gyro)
   (if (keywordp (car __gyro))
       (send* _gyro __gyro)
     (progn
       (if __gyro (setq _gyro (car __gyro)))
       _gyro)))
  (:acc1
   (&rest __acc1)
   (if (keywordp (car __acc1))
       (send* _acc1 __acc1)
     (progn
       (if __acc1 (setq _acc1 (car __acc1)))
       _acc1)))
  (:acc2
   (&rest __acc2)
   (if (keywordp (car __acc2))
       (send* _acc2 __acc2)
     (progn
       (if __acc2 (setq _acc2 (car __acc2)))
       _acc2)))
  (:magn
   (&rest __magn)
   (if (keywordp (car __magn))
       (send* _magn __magn)
     (progn
       (if __magn (setq _magn (car __magn)))
       _magn)))
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
    ;; float32 _ap_time
    4
    ;; float32 _wheel_R
    4
    ;; float32 _wheel_L
    4
    ;; geometry_msgs/Vector3 _gyro
    (send _gyro :serialization-length)
    ;; geometry_msgs/Vector3 _acc1
    (send _acc1 :serialization-length)
    ;; geometry_msgs/Vector3 _acc2
    (send _acc2 :serialization-length)
    ;; geometry_msgs/Vector3 _magn
    (send _magn :serialization-length)
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
     ;; float32 _ap_time
       (sys::poke _ap_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wheel_R
       (sys::poke _wheel_R (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wheel_L
       (sys::poke _wheel_L (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _gyro
       (send _gyro :serialize s)
     ;; geometry_msgs/Vector3 _acc1
       (send _acc1 :serialize s)
     ;; geometry_msgs/Vector3 _acc2
       (send _acc2 :serialize s)
     ;; geometry_msgs/Vector3 _magn
       (send _magn :serialize s)
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
   ;; float32 _ap_time
     (setq _ap_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wheel_R
     (setq _wheel_R (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wheel_L
     (setq _wheel_L (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _gyro
     (send _gyro :deserialize buf ptr-) (incf ptr- (send _gyro :serialization-length))
   ;; geometry_msgs/Vector3 _acc1
     (send _acc1 :deserialize buf ptr-) (incf ptr- (send _acc1 :serialization-length))
   ;; geometry_msgs/Vector3 _acc2
     (send _acc2 :deserialize buf ptr-) (incf ptr- (send _acc2 :serialization-length))
   ;; geometry_msgs/Vector3 _magn
     (send _magn :deserialize buf ptr-) (incf ptr- (send _magn :serialization-length))
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _omega
     (setq _omega (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sim_real_msg_interface::Odometry :md5sum-) "89f83a34da9c89a443ae852ee70fa087")
(setf (get sim_real_msg_interface::Odometry :datatype-) "sim_real_msg_interface/Odometry")
(setf (get sim_real_msg_interface::Odometry :definition-)
      "std_msgs/Header header
float32 ap_time
float32 wheel_R
float32 wheel_L
geometry_msgs/Vector3 gyro
geometry_msgs/Vector3 acc1
geometry_msgs/Vector3 acc2
geometry_msgs/Vector3 magn
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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :sim_real_msg_interface/Odometry "89f83a34da9c89a443ae852ee70fa087")


