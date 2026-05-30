# ROS2
```bash
source /opt/ros/jazzy/setup.bash
source <install_folder>/local_setup.bash
```

```bash
rqt # gui to replace many command-line
colcon_cd <pkg_name> # cd to pkg folder
```

## Build
```bash
# resolve dependencies
rosdep install -i --from-path src --rosdistro jazzy -y
# build
colcon build --symlink-install # build (python modifications do not require rebuild)
colcon build --packages-select <pkg_name> # rebuild only specific package
colcon build --event-handlers console_direct+ # show console output to debug
```
To not build a specific package, place an empty file `COLCON_IGNORE` in its directory.

## Introspection
```bash
ros2 run rqt_console rqt_console # to inspect logs

ros2 node list
ros2 node info /myNode

ros2 topic list
ros2 topic echo /cmd_vel
ros2 topic echo /odom --field twist.twist.linear.x
ros2 topic hz /camera/color/image_raw # may return erroneous values

ros2 run rviz2 rviz2

rqt # GUI from where various tools (see below) can be launched
ros2 run rqt_image_view rqt_image_view
ros2 run rqt_graph rqt_graph # (or launch directly using alias rqt_graph)
ros2 run rqt_tf_tree rqt_tf_tree

ros2 run tf2_ros tf2_echo map base_link
ros2 run tf2_tools view_frames # generates a pdf with tf

ros2 run rqt_plot rqt_plot /odom/twist/twist/linear/x
```

## Operations
```bash
ros2 launch <pkg_name> <launch_name> # launch files have extension .launch.py
ros2 run <pkg_name> <exec_name>
```

## Parameters
```bash
ros2 param get <node_name> <param_name>
ros2 param set <node_name> <param_name> <value>
ros2 param dump <node name> # print all param and values to stdout
ros2 param dump /turtlesim > cfg1.yaml # print to file
ros2 param load /turtlesim cfg1.yaml # load parameters
ros2 run <pkg_name> <exec_name> --ros-args --params-file cfg1.yaml # run with param
```

## Bags
```bash
cd /bag_files # move to where bag should be saved
ros2 bag record -o my_bag_name <topic_name1> <topic_name2>
ros2 bag info <bag_file>
ros2 bag play --clock --loop <bag_file>
```

## Node
### Callback groups
Types of callback groups:

- Reentrant: allow parallel execution (even a same callback can be executed multiple times in parallel)
- Mutually Exclusive: prevents parallel execution

Callbacks belonging to different groups can always be executed in parallel.  
By default all callbacks are assigned to a same Mutually Exclusive callback group.
```cpp
my_callback_group = create_callback_group(rclcpp::CallbackGroupType::MutuallyExclusive);
rclcpp::SubscriptionOptions options;
options.callback_group = my_callback_group;
```

### Timer callback
```cpp
// hpp, private member
rclcpp::TimerBase::SharedPtr compute_timer_;

// cpp, in node constructor
timer_ = this->create_timer(
  std::chrono::milliseconds(10),
  std::bind(&myNode::myCallback, this),
  my_callback_group);

// cpp, method definition
void myNode::myCallback()
{...}
```
`create_timer` was introduced as node class method in jazzy, in humble use it from `#include <rclcpp/timer.hpp>` with slightly different arguments.

### QoS
Quality of Service profiles have parameters

- History: _KeepLast_ with a queue size (depth)
- Reliability:
    - _Best effort_: lower bandwidth use at the cost of loosing some messages
    - _Reliable_: guarantees delivery (uses retry) at the cost of high bandwidth  
    A suscriber cannot be _Reliable_ if the publisher is _Best effort_
- Durability:
    - _Volatile_: not storing messages for late-joiners
    - _Transient local_: stores messages for late-joiners nodes  
    A suscriber cannot be _Transient local_ if the publisher is _Volatile_

```
auto my_qos = rclcpp::QoS(rclcpp::KeepLast(1)).best_effort().durability_volatile();
```

### Subscription callback
A subscriber with specific QoS and callback group:
```cpp
// hpp, private methods and members
void myCallback(const std_msgs::msg::Int32& msg);
rclcpp::Subscription<std_msgs::msg::Int32>::SharedPtr my_sub_;

// cpp, in node constructor
rclcpp::SubscriptionOptions my_options;
my_options.callback_group = my_callback_group;
my_sub_ = this->create_subscription<Int32>(
    "/my_topic",
    my_qos,
    std::bind(&myNode::myCallback, this, std::placeholders::_1),
    my_options);

// cpp, method definition
void myNode::myCallback(const std_msgs::msg::Int32& msg)
{...}
```


### RLCPP messages
ROS Client Library for C++ enables printing messages of different severity (DEBUG, INFO, WARN, ERROR, FATAL).
It uses printf-style formatting,
```cpp
double rate = 2.899;
int count = 54;
std::string frame = "base_link";
bool enabled = true;

RCLCPP_INFO(
  this->get_logger(),
  "ID= %5d | Hz= %6.2f | frame %s | %s", // 6.2f -> "  2.90" (6 characters total)
  count, rate, frame.c_str(), enabled ? "yes" : "no");
  
RCLCPP_INFO_THROTTLE(
  this->get_logger(), *this->get_clock(), 2000, // milliseconds
  "running node");
```
