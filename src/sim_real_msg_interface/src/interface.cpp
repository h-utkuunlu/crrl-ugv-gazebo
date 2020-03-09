#include "ros/ros.h"
#include "sim_real_msg_interface/Odometry.h"
#include "sim_real_msg_interface/Commands.h"
#include "gazebo_msgs/LinkStates.h"
#include "gazebo_msgs/LinkState.h"
#include "gazebo_msgs/ModelStates.h"
#include "gazebo_msgs/ModelState.h"
#include "geometry_msgs/Twist.h"
#include <string>
#include <iostream>
#include <cmath>
#include <vector>

void linkStateCallback(const gazebo_msgs::LinkStates &msg){  
  std::cout << msg.name[1] << std::endl;
}

int main(int argc, char ** argv){
  ros::init(argc, argv, "sim_real_msg_interface_node");

  ros::NodeHandle nh;
  ROS_INFO_STREAM("Initialized simulation-to-real robot interface node");

  ros::Subscriber sub = nh.subscribe("gazebo/link_states", 1000, &linkStateCallback);

  ros::Publisher linkStatesPublisher = nh.advertise<gazebo_msgs::LinkState>("/gazebo/set_link_state", 1000);

  ros::Rate rate(1000);

  float counter = 0.0f;
  float factor = 0.5f;

  // Generate drivetrains
  std::vector<std::string> left, right;
  left.push_back("crrl_ugv::left_forward");
  left.push_back("crrl_ugv::left_rear");
  right.push_back("crrl_ugv::right_forward");
  right.push_back("crrl_ugv::right_rear");
    
  while(ros::ok()){
    gazebo_msgs::LinkState msgLeft, msgRight;
    geometry_msgs::Twist msgTwistLeft, msgTwistRight;

    msgTwistLeft.angular.y = std::sin(counter/factor)*5.0f;
    msgTwistRight.angular.y = std::sin(counter/factor)*5.0f*-1.0f;
    msgLeft.twist = msgTwistLeft;
    msgRight.twist = msgTwistRight;
    msgLeft.reference_frame = "world";
    msgRight.reference_frame = "world";
    
    for(int i = 0; i < left.size(); i++){
      msgLeft.link_name = left[i];
      linkStatesPublisher.publish(msgLeft);
    }

    for(int i = 0; i < right.size(); i++){
      msgRight.link_name = right[i];
      linkStatesPublisher.publish(msgRight);
    }
    
    counter = counter + 1.0f;
  }
  
  ros::spin();
}
