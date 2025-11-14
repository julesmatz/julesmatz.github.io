# ROS

```bash
source devel/setup.bash
```

## Build Commands
```bash
catkin build  # Build entire workspace
catkin build [pkg]  # Build specific package
catkin build --this  # Build the package containing working directory
```

## Inspection 
```bash
rosparam list  # List parameters
rosparam get /param  # Get value

rospack list  # List all packages
rospack find <pkg>  # Locate package

rosnode list  # List active nodes
rosnode info /node_name  # Node details

rostopic list  # List all topics
rostopic type /topic  # show msg type
rostopic echo /topic  # Print messages
rostopic hz /topic  # Check publishing rate

rosmsg list  # List all messages
rosmsg package <pkg>  # List messages in package
rosmsg show <msg_type>  # Show message fields

rosbag info file.bag  # Bag metadata
```

## Operations
```bash
rosparam set /param value  # Set value
rosparam dump file.yaml  # Save params

rosrun <pkg> <node> [args]  # Run node, arg ex: viz:=true
roslaunch <pkg> <launch_file>  # call launch file
rosnode kill /node_name

rostopic pub /topic type args  # Publish message

rosbag record -a  # Record all topics
rosbag record -O file.bag /topic1 /topic2
rosbag play file.bag  # Replay bag
```

## rviz and rqt
```bash
rosrun rviz rviz  # Launch rviz
rosrun rviz rviz -d <path_to_config_file>.rviz # Launch with specific config
rqt  # Launch rqt with all plugins
rqt_console # To see msg published to rosout (e.g. with  rospy.loginfo)
rosrun rqt_graph rqt_graph  # Launch only rqt_graph
rosrun rqt_plot rqt_plot  # Launch only rqt_plot
rosrun rqt_bag rqt_bag  # Play bags with options
rosrun rqt_reconfigure rqt_reconfigure # tune dynamic reconfigure param
```
if rqt windows are frozen, use `rqt --clear-config`.

## tf
`tf` Manage transforms between coordinate frames.
It is build as a tree of frames. (Each child has one parent, a parent can have many child).
Conventional frames:

*   `map`: World-fixed, drift is corrected (e.g., by SLAM).
*   `odom`: World-fixed, drifts is not corrected (from odometry).
*   `base_link`: Attached to the robot's base.

#### Example of static tf (published once and cached, on topic `\tf_static`)
It can be published from a launch file
```xml
<node pkg="tf" type="static_transform_publisher" name="laser_broadcaster" args="0.2 0 0.1 0 0 0 base_link laser 100" />
```

or better, if the frame is defined also in the URDF, call the node from package `robot_state_publisher` in a launch file
```xml
<node pkg="robot_state_publisher" type="robot_state_publisher" name="rob_st_pub" />
```
The robot_state publisher subscribes to topic `joint states` so it can publish also dynamic transforms.

#### Example of dynamic tf (published continuously, on topic `\tf`)
```cpp
#include <tf/transform_broadcaster.h>

tf::TransformBroadcaster broadcaster;

// Typically inside a callback or loop in your node
tf::Transform transform;
transform.setOrigin(tf::Vector3(odom_msg->pose.pose.position.x, odom_msg->pose.pose.position.y, 0.0));

tf::Quaternion q;
tf::quaternionMsgToTF(odom_msg->pose.pose.orientation, q);
transform.setRotation(q);

// Broadcast transform from base_link to sensor_frame
broadcaster.sendTransform(tf::StampedTransform(transform, 
    ros::Time::now(), // use current time (critical)
    "odom",           // parent frame
    "base_link"));    // child frame
```

```cpp
#include <tf/transform_listener.h>

tf::TransformListener listener;
tf::StampedTransform transform;

try {
  // This will work for both static and dynamic transforms
  listener.lookupTransform("map", "base_link", ros::Time(0), transform);
  // Use the transform...
}
catch (tf::TransformException &ex) {
  ROS_WARN("TF Lookup failed: %s", ex.what());
}
```

```bash
rosrun rqt_tf_tree rqt_tf_tree # visualize tf tree
rosrun tf tf_echo [source_frame] [target_frame] # see transform between specific frames
```

## Tips
1. **TAB Completion**: Use liberally for packages/nodes/types
3. **Namespaces**: Organize nodes with `ns` in launch files
9. **Unused pkg** To inform `catkin build` not to build a specific package, an empty file `CATKIN_IGNORE` can be placed at the root of the package.