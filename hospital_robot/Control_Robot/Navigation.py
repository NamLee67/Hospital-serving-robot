import os
import subprocess
import time 

project_dir = "/home/huuhoa/hospital_robot"
lidar_dir = "/home/huuhoa/lidar_ws"

launch_dir = os.path.join(project_dir, "src", "hospital_package", "launch")

launch_file = "launch_sim.launch.py"


receive_command = os.path.join(project_dir, "Control_Robot", "Receive_Command.py")
odometry_encoder = os.path.join(project_dir, "Control_Robot", "Main_odom.py")


commands = [

    ("Rviz2", f"cd {project_dir} && source install/setup.bash && ros2 launch hospital_package {launch_file}"),

    # ("Calculate Odom", f"python3 {odometry_encoder}"),

    ("Receive Command", f"python3 {receive_command}"),

    ("Lidar", f"cd {lidar_dir} && source install/setup.bash && ros2 launch rplidar_ros rplidar_a1_launch.py serial_port:=/dev/ttyUSB0 serial_baudrate:=115200 scan_mode:=Standard frame_id:=laser_frame"),

    ("Slam_toolbox", f"ros2 launch slam_toolbox online_async_launch.py slam_params_file:=/home/huuhoa/hospital_robot/src/hospital_package/config/mapper_params_online_async_localization.yaml use_sim_time:=false"),
 
    ("Navigation", f"cd {project_dir} && source install/setup.bash && ros2 launch nav2_bringup navigation_launch.py")
]

for title, cmd in commands:
    subprocess.Popen([
        "gnome-terminal",
        "--tab", "--title=" + title, "--", "bash", "-c", f"echo 'Tab: {title}'; {cmd}; exec bash"
    ])
    time.sleep(2)
