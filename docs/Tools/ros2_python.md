## ROS2 Python package
Structure
```
my_package/
      package.xml         # meta info
      resource/my_package # marker file
      setup.cfg           # required for executables for ros2 run, must match with meta info
      setup.py            # instructions to install pkg
      my_package/         # required to find pkg, contains __init__.py
```
Creation
```
ros2 pkg create --build-type ament_python --license Apache-2.0 --node-name my_node my_package
```