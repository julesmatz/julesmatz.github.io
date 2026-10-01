# ROS2

### Create package
```bash
cd src/
ros2 pkg create --build-type ament_cmake my_pkg  # for C++
ros2 pkg create --build-type ament_python my_pkg # for python
```

note that in python, both `package.xml` and `setup.py` must be filled for a node to be runnable, in `setup.py` add it as an entry point with the desired name
```python
entry_points={
	'console_scripts': [
		'service = py_srvcli.service_member_function:main',
	],
},
```

automatically install dependencies of packages (run from ros_ws)
```bash
rosdep install -i --from-path src --rosdistro humble -y
```

### to kill all ros2
```
pkill -f "ros2 launch"
```



# to build (from ros_ws)
```
rm -rf build install log # not necessary, only to make sure it is built from a clean slate
colcon build
colcon build --packages-select my_package # to build only one specific package
```

# source the ros_ws
```
source install/setup.bash
```


# Example node in Python
```python
import rclpy
from rclpy.executors import ExternalShutdownException
import traceback
from rclpy.node import Node

# all node classes
# ...

def callback(self, msg):
    # catching exceptions in callback is good practice, it better catches errors
    # and it allows the node to continue spinning
    try:
        self.process(msg)
    except Exception:
        self.get_logger().error(traceback.format_exc())


def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = None
    try:
        minimal_publisher = MinimalPublisher()
        rclpy.spin(minimal_publisher)

    except (KeyboardInterrupt, ExternalShutdownException): # normal shutdowns
        pass

    except Exception:
        error_trace = traceback.format_exc()
        if minimal_publisher is not None:
            minimal_publisher.get_logger().fatal(error_trace)
        else:
            print(f"Error during node initialization:\n{error_trace}")
        traceback.print_exc()

    finally:
        if minimal_publisher is not None:
            minimal_publisher.destroy_node()
        rclpy.try_shutdown() # only shutdown if ROS is still running
        # in Humble, use instead
        # if rclpy.ok():
	    #     rclpy.shutdown()

if __name__ == '__main__':
    main()
```


# Example node in C++

```cpp
// my_node.hpp
#pragma once

#include <rclcpp/rclcpp.hpp>

#include <std_msgs/msg/float32.hpp>
#include <geometry_msgs/msg/pose.hpp>

class MyNode : public rclcpp::Node
{
public:
    MyNode();

private:
    // Callbacks
    void sensorCallback(const geometry_msgs::msg::Pose::ConstSharedPtr msg);
    void timerCallback();

    //Control
    void controlStep();

    // Parameters
    double yaw_setpoint_{0.0};
    double K_{1.0};

    // State
    geometry_msgs::msg::Pose pose_;
    bool pose_received_{false};

    // ROS interfaces
    rclcpp::Publisher<std_msgs::msg::Float32>::SharedPtr publisher_;
    rclcpp::Subscription<geometry_msgs::msg::Pose>::SharedPtr subscriber_;

    // Timer
    rclcpp::TimerBase::SharedPtr timer_;
};
```

```cpp
// my_node.cpp
#include "my_node.hpp"

#include <cmath>
#include <functional>
#include <tf2/utils.h>

MyNode::MyNode()
: Node("my_node_example"),
  pose_received_(false)
{
    // Parameter declaration and loading
    yaw_setpoint_ = this->declare_parameter("yaw_setpoint", 0.0);
    K_ = this->declare_parameter("K", 1.0);

    // QoS
    const auto qos = rclcpp::QoS(rclcpp::KeepLast(10)).reliable().durability_volatile();

    // Publisher
    publisher_ = this->create_publisher<std_msgs::msg::Float32>("out_topic", qos);

    // Subscriber
    subscriber_ = this->create_subscription<geometry_msgs::msg::Pose>(
        "in_topic", qos,
        std::bind(&MyNode::sensorCallback, this, std::placeholders::_1));

    // Timer (500 ms)
    timer_ = this->create_wall_timer(
        std::chrono::milliseconds(500),
        std::bind(&MyNode::timerCallback, this));
}

void MyNode::sensorCallback(
    const geometry_msgs::msg::Pose::ConstSharedPtr msg)
{
    pose_ = *msg;
    pose_received_ = true;

    RCLCPP_INFO(this->get_logger(), "Position: z=%.3f", position_.z);
}

void MyNode::timerCallback()
{
    controlStep();
}

void MyNode::controlStep()
{
    if (!pose_received_)
    {
        return;
    }

    const geometry_msgs::msg::Quaternion& q = pose_.orientation;
    const double yaw = tf2::getYaw(q);
    const double yaw_error = yaw_setpoint_ - yaw;

    std_msgs::msg::Float32 msg;
    msg.data = static_cast<float>(K_ * yaw_error);

    publisher_->publish(msg);
}
```

```cpp
// my_main.cpp
#include <memory>
#include <rclcpp/rclcpp.hpp>
#include "my_node.hpp"

int main(int argc, char * argv[])
{
    rclcpp::init(argc, argv);
    try
    {
        rclcpp::spin(std::make_shared<MyNode>());
    }
    catch (const std::exception & e)
    {
        RCLCPP_FATAL(rclcpp::get_logger("main"), "Fatal exception: %s",e.what());
    }
    rclcpp::shutdown();
    return 0;
}
```




