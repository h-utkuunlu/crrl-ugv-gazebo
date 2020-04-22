import rospy
from geometry_msgs.msg import Twist
import getch

def send_vel():
    rospy.init_node('cmd_vel', anonymous=True)

    vel_publisher = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    
    linear_vel = 0.0
    angular_vel = 0.0

    linear_cap = 2.0
    angular_cap = 2.0

    linear_increment = 0.2
    angular_increment = 0.2
    
    while not rospy.is_shutdown():

        key = getch.getch()

        if key == 'a':
            angular_vel = min(angular_cap, angular_vel + angular_increment)
        elif key == 'd':
            angular_vel = max(-angular_cap, angular_vel - angular_increment)
        elif key == 'w':
            linear_vel = min(linear_cap, linear_vel + linear_increment)
        elif key == 's':
            linear_vel = max(-linear_cap, linear_vel - linear_increment)

        print("Linear: %.1f, Angular: %.1f" % (linear_vel, angular_vel))
            
        vel_msg = Twist()
        vel_msg.linear.x = linear_vel
        vel_msg.angular.z = angular_vel

        vel_publisher.publish(vel_msg)
        
            
if __name__ == '__main__':
    try:
        send_vel()
    except rospy.ROSInterruptException:
        pass
