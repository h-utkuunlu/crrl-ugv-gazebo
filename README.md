# CRRL UGV Gazebo
Requisite files to simulate CRRL UGV on Gazebo / Ros

# How to run

1. Download this repo using `git clone https://github.com/h-utkuunlu/crrl-ugv-gazebo`
1. Change directory to the repo and run `catkin_make`
1. Install any requisite packages as needed (image_proc, pcl_ros, stereo_image_proc, ...)
1. [optional, if path is not in ROS] Run `source devel/setup.<ext>` to make packages visible. Replace `<ext>` with your shell
1. Run `roslaunch crrl_ugv_gazebo empty_world.launch` to initiate an empty world.
1. If Willow Garage is in your Gazebo models, you can also run  `roslaunch crrl_ugv_gazebo willowgarage.launch` with a small modification(see below)
1. To initiate teleop, open a separate terminal and run `ROS_NAMESPACE=/ap rosrun kbd_interface kbd_interface.py`. Manual is provided on screen. 

* To resolve the issue with ground plane and carpet interlacing, it is necessary to lift the willowgarage world by about 1mm in their model page. In .gazebo/models/willowgarage/model-1_2.sdf, replace
`<pose>-20 -20 0 0 0 0</pose>` with `<pose>-20 -20 0.001 0 0 0</pose>`. This way the camera images are more sensible.

# Known Issues
1. ZED camera emulation for depth image is not reliable. Even though pcl_ros package is used to convert the pointcloud (obtained from stereo_image_proc package) to a depth image, it appears to take right camera image directly.
1. Calibration between camera and VLP is needed. Currently the pointclouds do not overlap
1. Positioning of ZED camera (and its associated frame) is approximate. Further refinements are needed
1. Only stereo camera setup is supported
1. Odometry information provided from AP module is not present. It is omitted for now since no one is currently using it
1. VLP resolution is not as fine compared to original, due to processing issues. Hardware acceleration is supported, but it is currently deactivated. To enable, modify the appropriate xacro property in src/crrl_ugv_desc/urdf/crrl_ugv.xacro
1. Collision boxes for the wheels are set to be a narrow disk rather than its full height. Otherwise, turns are not at all realistic

# TO DO
- [ ] Add MTC5 map
- [ ] Emulate odometry data as provided by AP module
