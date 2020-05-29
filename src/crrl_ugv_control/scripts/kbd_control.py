import rospy
from geometry_msgs.msg import Twist
import curses

def send_vel():

    # Initialize terminal
    stdscr = curses.initscr()
    curses.noecho()
    stdscr.nodelay(1)
    stdscr.addstr(0, 0, "UGV Keyboard Control")

    # Initialize ROS topic and message
    rospy.init_node('cmd_vel', anonymous=True)
    vel_publisher = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    rate = rospy.Rate(10)

    # Control parameters
    linear_vel = 0.0
    angular_vel = 0.0

    linear_cap = 2.0
    angular_cap = 2.0

    linear_increment = 0.2
    angular_increment = 0.2

    while not rospy.is_shutdown():

        # Read character if there is any
        key = stdscr.getch()

        # Terminate
        if key == ord('q'):
            break
        
        # Control updates wherever necessary
        if key == ord('a'):
            angular_vel = min(angular_cap, angular_vel + angular_increment)
        elif key == ord('d'):
            angular_vel = max(-angular_cap, angular_vel - angular_increment)
        elif key == ord('w'):
            linear_vel = min(linear_cap, linear_vel + linear_increment)
        elif key == ord('s'):
            linear_vel = max(-linear_cap, linear_vel - linear_increment)
        elif key == ord(' '):
            linear_vel = 0.0
            angular_vel = 0.0

        # Write to screen
        stdscr.clrtoeol()
        stdscr.refresh()
        stdscr.addstr(1, 0, "L: %.1f, A: %.1f" % (linear_vel, angular_vel))
            
        # Send message
        vel_msg = Twist()
        vel_msg.linear.x = linear_vel
        vel_msg.angular.z = angular_vel
        vel_publisher.publish(vel_msg)

        # Ensure correct rate
        rate.sleep()
        
if __name__ == '__main__':
    try:
        send_vel()
    except rospy.ROSInterruptException:
        pass
    finally:
        curses.endwin()
