import rclpy
from rclpy.node import Node
from geometry_msgs.msg import TransformStamped, Quaternion
from nav_msgs.msg import Odometry
import tf2_ros
import serial
import math
import re

class EncoderOdometry(Node):
    def __init__(self):
        super().__init__('encoder_odometry')

        self.serial_port = "/dev/ttyUSB1"
        self.baud_rate = 115200
        self.serial_conn = serial.Serial(self.serial_port, self.baud_rate, timeout=0.1)

        self.declare_parameter('wheel_radius', 0.05)
        self.declare_parameter('wheel_separation', 0.325)
        self.declare_parameter('ticks_per_rev', 1600)

        self.wheel_radius = self.get_parameter('wheel_radius').value
        self.wheel_separation = self.get_parameter('wheel_separation').value
        self.ticks_per_rev = self.get_parameter('ticks_per_rev').value

        self.x = 0.0
        self.y = 0.0
        self.theta = 0.0

        self.prev_ticks_left = None
        self.prev_ticks_right = None

        self.tf_broadcaster = tf2_ros.TransformBroadcaster(self)

        self.odom_pub = self.create_publisher(Odometry, 'odom', 10)

        self.get_logger().info("Encoder Odometry Node Started")

        self.create_timer(0.03, self.request_and_read_serial)

    def request_and_read_serial(self):
        try:
            # self.serial_conn.write("p".encode('utf-8'))
            self.serial_conn.flush()

            response = self.serial_conn.readline().decode('utf-8').strip()
            print(f'Command received: {response}')

            if not response:
                self.get_logger().warn("No response from STM32")
                return

            # match = re.search(r"L:(-?\d+), R:(-?\d+)", response)
            match = re.search(r"L:\s*(-?\d+),\s*R:\s*(-?\d+)", response)

            if not match:
                self.get_logger().warn(f"Invalid encoder format: {response}")
                return

            ticks_left_now = int(match.group(1))
            ticks_right_now = int(match.group(2))

            if self.prev_ticks_left is None or self.prev_ticks_right is None:
                self.prev_ticks_left = ticks_left_now
                self.prev_ticks_right = ticks_right_now
                return

            self.update_odometry(self.prev_ticks_left, ticks_left_now, self.prev_ticks_right, ticks_right_now)

        except Exception as e:
            self.get_logger().error(f"Error reading serial data: {e}")

    def update_odometry(self, ticks_left_prev, ticks_left_now, ticks_right_prev, ticks_right_now):
        delta_ticks_left = ticks_left_now - ticks_left_prev
        delta_ticks_right = ticks_right_now - ticks_right_prev

        self.prev_ticks_left = ticks_left_now
        self.prev_ticks_right = ticks_right_now

        distance_left = (delta_ticks_left / self.ticks_per_rev) * (2 * math.pi * self.wheel_radius)
        distance_right = (delta_ticks_right / self.ticks_per_rev) * (2 * math.pi * self.wheel_radius)

        delta_s = (distance_right + distance_left) / 2.0
        delta_theta = -(distance_right - distance_left) / self.wheel_separation

        self.x += delta_s * math.cos(self.theta + delta_theta / 2.0)
        self.y += delta_s * math.sin(self.theta + delta_theta / 2.0)
        self.theta += delta_theta

        self.theta = ((self.theta + math.pi) % (2 * math.pi) - math.pi)

        self.publish_odometry()
        self.publish_tf()

    def publish_odometry(self):
        odom_msg = Odometry()
        odom_msg.header.stamp = self.get_clock().now().to_msg()
        odom_msg.header.frame_id = 'odom'
        odom_msg.child_frame_id = 'base_link'

        odom_msg.pose.pose.position.x = self.x
        odom_msg.pose.pose.position.y = self.y
        odom_msg.pose.pose.position.z = 0.0

        quat = self.quaternion_from_euler(0, 0, self.theta)
        odom_msg.pose.pose.orientation = quat

        self.odom_pub.publish(odom_msg)

    def publish_tf(self):
        t = TransformStamped()
        t.header.stamp = self.get_clock().now().to_msg()
        t.header.frame_id = 'odom'
        t.child_frame_id = 'base_link'

        t.transform.translation.x = self.x
        t.transform.translation.y = self.y
        t.transform.translation.z = 0.0

        quat = self.quaternion_from_euler(0, 0, self.theta)
        t.transform.rotation = quat

        self.tf_broadcaster.sendTransform(t)

    def quaternion_from_euler(self, roll, pitch, yaw):
        qx = math.sin(roll/2) * math.cos(pitch/2) * math.cos(yaw/2) - math.cos(roll/2) * math.sin(pitch/2) * math.sin(yaw/2)
        qy = math.cos(roll/2) * math.sin(pitch/2) * math.cos(yaw/2) + math.sin(roll/2) * math.cos(pitch/2) * math.sin(yaw/2)
        qz = math.cos(roll/2) * math.cos(pitch/2) * math.sin(yaw/2) - math.sin(roll/2) * math.sin(pitch/2) * math.cos(yaw/2)
        qw = math.cos(roll/2) * math.cos(pitch/2) * math.cos(yaw/2) + math.sin(roll/2) * math.sin(pitch/2) * math.sin(yaw/2)

        return Quaternion(x=qx, y=qy, z=qz, w=qw)


def main(args=None):
    rclpy.init(args=args)
    node = EncoderOdometry()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.serial_conn.close()  
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
