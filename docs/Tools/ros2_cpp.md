## ROS2 C++ package
Structure
```
my_package/
     config/             # yaml config files
     rviz/               # rviz config files
     doc/                # documentation
     msg/                # custom msg definitions
     launch/             # launch files
     include/my_package  # headers .h and .hpp
     src/                # C++ source code
     urdf/
     srv/
     action/
     test/
     CMakeLists.txt      # instructions to build code
     package.xml         # meta info
     LICENSE
     
```
Creation
```
ros2 pkg create --build-type ament_cmake --license Apache-2.0 --node-name my_node my_package

```