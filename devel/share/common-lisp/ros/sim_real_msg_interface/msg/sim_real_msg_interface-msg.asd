
(cl:in-package :asdf)

(defsystem "sim_real_msg_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Commands" :depends-on ("_package_Commands"))
    (:file "_package_Commands" :depends-on ("_package"))
    (:file "Odometry" :depends-on ("_package_Odometry"))
    (:file "_package_Odometry" :depends-on ("_package"))
  ))