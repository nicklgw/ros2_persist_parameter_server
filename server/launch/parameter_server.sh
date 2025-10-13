#!/bin/bash

export ROS_DOMAIN_ID=5
source /opt/ros/humble/setup.bash
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file:///etc/cyclonedds.xml

mkdir -m a=rwx -p /var/log/bzlrobot/parameter_server
export ROS_LOG_DIR="/var/log/bzlrobot/parameter_server"

/usr/bin/python3 /opt/ros/humble/bin/ros2 launch parameter_server parameter_server.launch.py
