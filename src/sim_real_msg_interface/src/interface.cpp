#include "ros/ros.h"
#include "sim_real_msg_interface/Odometry.h"
#include "sim_real_msg_interface/Commands.h"
#include "geometry_msgs/Twist.h"
#include <string>
#include <iostream>
#include <cmath>
#include <vector>

// Global declaration
ros::Publisher pub;

float scaleVel = 4.0f;
float scaleOmega = 4.0f;

void commandsCallback(const sim_real_msg_interface::Commands &msg){  
  geometry_msgs::Twist twistMsg;
  twistMsg.linear.x = msg.velocity * scaleVel;
  twistMsg.angular.z = msg.omega * scaleOmega;
  pub.publish(twistMsg);
}

int main(int argc, char ** argv){
  ros::init(argc, argv, "sim_real_msg_interface_node");

  ros::NodeHandle nh;
  ROS_INFO_STREAM("Initialized simulation-to-real robot interface node");
  ros::Subscriber sub = nh.subscribe("/ap/cmd_vel", 1000, &commandsCallback);
  pub = nh.advertise<geometry_msgs::Twist>("sim_cmd_vel", 100);

  ros::Rate rate(100);
  ros::spin();
}
