# CRRL UGV Gazebo
Requisite files to simulate CRRL UGV on Gazebo / Ros

# Requirements
The system depends on
- velodyne-description
- velodyne-simulator
- velodyne-gazebo-plugins
- pcl-ros

to simulate Velodyne LiDAR attached to the robot,
- image-proc
- stereo-image-proc

to use stereo camera on board, and
- gazebo-ros-control
- gazebo-plugins
- gazebo-ros-pkgs

to simulate skid-steering controller. System is tested to work on standard installations found in apt.

# Installation

1. Install prerequisites mentioned above
1. Download the code: `git clone https://github.com/h-utkuunlu/crrl-ugv-gazebo`
1. Compile:  `cd crrl-ugv-gazebo && catkin_make`
1. Copy the model to Gazebo model folder:  `cp -r mtc5_basement_stl ~/.gazebo/models`
1. [optional, if path is not in ROS] Run `source devel/setup.<ext>` to make packages visible to ROS. Replace `<ext>` with your shell


# Operation

Currently there are 3 environments supported: empty world (mostly for debugging purposes), Willow Garage environment, and NYU Tandon's MTC5 basement, where CRRL is located. Commands to launch each environment is given below: 

- Run `roslaunch crrl_ugv_gazebo empty_world.launch` to initiate an empty world.
- Run `roslaunch crrl_ugv_gazebo willowgarage.launch` to initiate Willow Garage environment (see the note below)
- Run `roslaunch crrl_ugv_gazebo mtc5_basement.launch` to initiate MTC5 basement.

To initiate teleop, open a separate terminal and run `roslaunch kbd_interface kbd_interface.launch`. Manual is provided on screen. 

*Note:* When Willow Garage environment is launched as is, the ground plane and floor of the model interlace, resulting in poor vision data. To resolve the issue it is necessary to lift the Willow Garage environment by about 1mm in their model page. In .gazebo/models/willowgarage/model-1_2.sdf, replace `<pose>-20 -20 0 0 0 0</pose>` with `<pose>-20 -20 0.001 0 0 0</pose>`. This way the camera images are more sensible.

# Options for launch

- process_stereo (default true) : Process stereo images to obtain depth, disparity map etc. Can be disabled for LiDAR-only to reduce computational workload.
- gazebo_gui (default false) : Show Gazebo GUI during simulation.

# Known Issues
1. ZED camera emulation for depth image is not reliable. Even though pcl_ros package is used to convert the pointcloud (obtained from stereo_image_proc package) to a depth image, it appears to take right camera image directly.
1. Calibration between camera and VLP is needed. Currently the pointclouds do not overlap
1. Positioning of ZED camera (and its associated frame) is approximate. Further refinements are needed
1. Only stereo camera setup is supported
1. Odometry information provided from AP module is not present. It is omitted for now since no one is currently using it
1. VLP resolution is not as fine compared to original, due to processing issues. Hardware acceleration is supported, but it is currently deactivated. To enable, modify the appropriate xacro property in src/crrl_ugv_desc/urdf/crrl_ugv.xacro
1. Collision boxes for the wheels are set to be a narrow disk rather than its full height. Otherwise, turns are not at all realistic
1. MTC5 map is based on an STL and as such lacks any visual features. Gazebo loads the COLLADA file exported from Onshape partially (i.e. most doors are missing)

# TO DO
- [X] Add MTC5 map
- [ ] Emulate odometry data as provided by AP module
