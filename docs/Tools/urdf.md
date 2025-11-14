# URDF
URDF (Unified Robot Description Format) is an XML-based file format describing physical structure, kinematic and dynamic properties, visual appearance, and collision model of a robot.

`<link>` is a **rigid body part**, containing properties `<visual>`, `<collision>` and `<inertial>`.

`<joint>` is the **connection between a parent link and a child link**. It has attribute `<fixed>`, `<continuous>` (can continously rotate), `<revolute>` (rotation with upper and lower limits), `<prismatic>`.

Only **tree structure** are allowed: it is not possible to represent closed kinematic chains (use SDF instead).

For large files, use **Xacro** to create reusable and parameterized subfiles.

## URDF Example

```xml
<?xml version="1.0"?>
<robot name="simple_robot">

  <!-- ===== LINKS (RIGID BODIES) ===== -->
  
  <!-- Base Link (root of our robot) -->
  <link name="base_link">
    <visual>
      <geometry>
        <cylinder length="0.1" radius="0.2"/>
      </geometry>
      <material name="blue">
        <color rgba="0 0 0.8 1"/>
      </material>
    </visual>
    <collision>
      <geometry>
        <cylinder length="0.1" radius="0.2"/>
      </geometry>
    </collision>
    <inertial>
      <mass value="5"/>
      <inertia ixx="0.1" ixy="0" ixz="0" iyy="0.1" iyz="0" izz="0.1"/>
    </inertial>
  </link>

  <!-- Arm Link -->
  <link name="arm_link">
    <visual>
      <geometry>
        <box size="0.6 0.1 0.1"/>
      </geometry>
      <material name="red">
        <color rgba="0.8 0 0 1"/>
      </material>
    </visual>
    <collision>
      <geometry>
        <box size="0.6 0.1 0.1"/>
      </geometry>
    </collision>
    <inertial>
      <mass value="3"/>
      <inertia ixx="0.05" ixy="0" ixz="0" iyy="0.05" iyz="0" izz="0.05"/>
    </inertial>
  </link>

  <!-- ===== JOINTS (CONNECTIONS) ===== -->
  
  <!-- Joint connecting base to arm -->
  <joint name="base_to_arm_joint" type="continuous">
    <parent link="base_link"/>
    <child link="arm_link"/>
    <origin xyz="0 0 0.1"/> <!-- Positioned on top of the base -->
    <axis xyz="0 0 1"/> <!-- Rotates around the Z-axis -->
    <limit effort="100" velocity="2.0"/>
  </joint>

</robot>
```
