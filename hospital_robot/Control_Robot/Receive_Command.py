import sys
import math
import threading
import serial
import rclpy
from rclpy.node import Node
from rclpy.executors import MultiThreadedExecutor
from geometry_msgs.msg import Twist, TransformStamped, Quaternion
from nav_msgs.msg import Odometry
import tf2_ros
import re


wheel_radius = 0.05
wheel_separation = 0.33

class TeleopWithSubscriber(Node):
    def __init__(self, serial_conn):
        super().__init__('teleop_twist_keyboard')
        self.serial_conn = serial_conn
        self.subscription = self.create_subscription(
            Twist,
            'cmd_vel_nav',
            self.listener_callback,
            10)
        self.linear_velocity_origin = 0.0
        self.angular_velocity_origin = 0.0

    def listener_callback(self, msg):
        self.get_logger().info("Received cmd_vel message")

        self.linear_velocity_origin = msg.linear.x 
        self.angular_velocity_origin = msg.angular.z 

        linear_velocity_turned = self.linear_velocity_origin
        angular_velocity_turned = self.angular_velocity_origin

        value_omega_left, value_omega_right = self.calculate_rpm(linear_velocity_turned, angular_velocity_turned)

        left_command = self.format_command(value_omega_left)
        right_command = self.format_command(value_omega_right)
        control_send = f"V,{left_command},{right_command}"
        self.get_logger().info(f"Command to send STM32: {control_send}")
        if self.serial_conn:
            try:
                self.serial_conn.write(control_send.encode())
            except serial.SerialException as e:
                self.get_logger().error(f"Failed to send command to STM32: {e}")

    def calculate_rpm(self, linear_velocity, angular_velocity):
        omega_left = (2 * linear_velocity - angular_velocity * wheel_separation) / (2 * wheel_radius)
        omega_right = (2 * linear_velocity + angular_velocity * wheel_separation) / (2 * wheel_radius)

        omega_left_rpm = (omega_left * 60) / (2 * math.pi)
        omega_right_rpm = (omega_right * 60) / (2 * math.pi)

        return omega_left_rpm, omega_right_rpm

    # def format_command(self, value_rpm):
    #     direction = 'F' if value_rpm >= 0 else 'B'
    #     return f"{direction}{abs(int(value_rpm)):02d}"
    def format_command(self, value_rpm):
        return f"{int(value_rpm):+03d}" 
    

def main():
    rclpy.init()
    serial_port = serial.Serial('/dev/ttyUSB2', baudrate=115200, timeout=1)
    teleop = TeleopWithSubscriber(serial_port)
    try:
        rclpy.spin(teleop)  
    except KeyboardInterrupt:
        pass
    finally:
        teleop.destroy_node()
        serial_port.close()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
