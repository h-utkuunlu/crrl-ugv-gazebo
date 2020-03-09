; Auto-generated. Do not edit!


(cl:in-package sim_real_msg_interface-msg)


;//! \htmlinclude Commands.msg.html

(cl:defclass <Commands> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (omega
    :reader omega
    :initarg :omega
    :type cl:float
    :initform 0.0))
)

(cl:defclass Commands (<Commands>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Commands>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Commands)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sim_real_msg_interface-msg:<Commands> is deprecated: use sim_real_msg_interface-msg:Commands instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Commands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_real_msg_interface-msg:header-val is deprecated.  Use sim_real_msg_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <Commands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_real_msg_interface-msg:velocity-val is deprecated.  Use sim_real_msg_interface-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'omega-val :lambda-list '(m))
(cl:defmethod omega-val ((m <Commands>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sim_real_msg_interface-msg:omega-val is deprecated.  Use sim_real_msg_interface-msg:omega instead.")
  (omega m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Commands>) ostream)
  "Serializes a message object of type '<Commands>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'omega))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Commands>) istream)
  "Deserializes a message object of type '<Commands>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'omega) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Commands>)))
  "Returns string type for a message object of type '<Commands>"
  "sim_real_msg_interface/Commands")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Commands)))
  "Returns string type for a message object of type 'Commands"
  "sim_real_msg_interface/Commands")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Commands>)))
  "Returns md5sum for a message object of type '<Commands>"
  "b37d025bd24f9e3a7356e8eb85f42da7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Commands)))
  "Returns md5sum for a message object of type 'Commands"
  "b37d025bd24f9e3a7356e8eb85f42da7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Commands>)))
  "Returns full string definition for message of type '<Commands>"
  (cl:format cl:nil "std_msgs/Header header~%float32 velocity~%float32 omega~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Commands)))
  "Returns full string definition for message of type 'Commands"
  (cl:format cl:nil "std_msgs/Header header~%float32 velocity~%float32 omega~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Commands>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Commands>))
  "Converts a ROS message object to a list"
  (cl:list 'Commands
    (cl:cons ':header (header msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':omega (omega msg))
))
