#! /home/huu201/.conda/envs/ros/bin/python

import rospy
from sim_real_msg_interface import Commands

def move():
    rospy.init_node('commands')
    vel_pub = rospy.Publisher('kbd_interface/commands', Commands, queue_size=10)
    rate = rospy.Rate(10)

    vel_msg = Commands()
    vel_msg.velocity = 0.5
    vel_msg.omega = 0.01

    while not rospy.is_shutdown():
       rospy.loginfo("Executing at %s" % rospy.get_time())
       pub.publish(vel_msg)
       rate.sleep()

if __name__ == "__main__":
    try:
        move()
    except rospy.ROSInterruptException:
        pass

    
