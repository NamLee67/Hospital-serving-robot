import sys
import threading
import math 

import geometry_msgs.msg 
import rclpy 

if sys.platform == 'win32': 
    import msvcrt 
else:
    import termios 
    import tty 
import serial 

#Robot_Parameter

wheel_radius = 0.05 #Bán kính bánh xe, đơn vị mét 
wheel_space = 0.325 #Khoảng cách giữa hai bánh xe, đơn vị mét 
msg = """
Reading from the keyboard and Publishing RPM to STM32! 
----------------------------
Moving around: 
    q       w       e
    a       s       d
    z       x       c 

r: increase max speeds by 10%
t: decrease max speeds by 10%
f: increase only linear speed by 10%
g: decrease only linear speed by 10%
v: increase only angular speed by 10%
b: decrease only angular speed by 10%

CTRL-C to quit
"""

moveBindings = {
    'w': (1, 0),  # Tiến
    's': (-1, 0),  # Lùi
    'd': (0, 1),  # Quay trái
    'a': (0, -1),  # Quay phải
    'q': (1, 1),  # Tiến và quay trái
    'e': (1, -1),  # Tiến và quay phải
    'z': (-1, 1),  # Lùi và quay trái
    'c': (-1, -1),  # Lùi và quay phải
    'x': (0, 0),  # Dừng
}

speedBindings = {
    'r': (1.1, 1.1),  # Tăng tốc độ 10%
    't': (0.9, 0.9),  # Giảm tốc độ 10%
    'f': (1.1, 1),    # Tăng tốc độ di chuyển thẳng 10%
    'g': (0.9, 1),    # Giảm tốc độ di chuyển thẳng 10%
    'v': (1, 1.1),    # Tăng tốc độ xoay 10%
    'b': (1, 0.9),    # Giảm tốc độ xoay 10%
}

def getKey(settings):
    if sys.platform == 'win32':
        key = msvcrt.getwch()
    else:
        tty.setraw(sys.stdin.fileno())
        key = sys.stdin.read(1)
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

def saveTerminalSettings():
    if sys.platform == 'win32':
        return None
    return termios.tcgetattr(sys.stdin)

def restoreTerminalSettings(old_settings):
    if sys.platform == 'win32':
        return
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)

def calculate_rpm(linear_velocity, angular_velocity):
    
    omega_left=(2*linear_velocity - angular_velocity*wheel_space)/(2*wheel_radius)
    omega_right=(2*linear_velocity + angular_velocity*wheel_space)/(2*wheel_radius)

    #Convert rad/s to rpm 
    omega_left_rpm = (omega_left*60)/(2*math.pi)
    omega_right_rpm = (omega_right*60)/(2*math.pi)

    #Limit rpm 
    omega_left_rpm=max(min(omega_left_rpm, 55),-55)
    omega_right_rpm=max(min(omega_right_rpm, 55),-55)

    return omega_left_rpm, omega_right_rpm

def format_command(value_rpm):
    return f"{int(value_rpm):+03d}" 

def main():
    settings = saveTerminalSettings()
    rclpy.init()
    node = rclpy.create_node('teleop_twist_keyboard')

    try:
        serial_port = serial.Serial('/dev/ttyUSB2', baudrate=115200, timeout=1)  # Change '/dev/ttyUSB1' as needed 115200
        print("Serial port opened successfully")
    except serial.SerialException as e:
        print(f"Failed to open serial port: {e}")
        return
    cmd_vel_pub = node.create_publisher(geometry_msgs.msg.Twist, 'cmd_vel', 10)

    linear_velocity_origin = 0.15 
    angular_velocity_origin = 1.0

    x_origin =  0.0     
    th_origin = 0.0  
    
    try:
        print(msg)
        while True:
            key = getKey(settings)
            if key in moveBindings.keys():
                x_origin = moveBindings[key][0]
                th_origin = moveBindings[key][1]

                linear_velocity_turned = x_origin*linear_velocity_origin
                angular_velocity_turned = th_origin*angular_velocity_origin
                print(f'Linear_velocity: {linear_velocity_turned} \nAngular_velocity: {angular_velocity_turned}')

                value_omega_left, value_omega_right = calculate_rpm(linear_velocity_turned, angular_velocity_turned)

                #Condition
                if abs(value_omega_left) > 120 or abs(value_omega_right) >120: 
                    print("Error: RPM value exceeds 120. Adjust speed or turn rate.")
                    continue

                #Create command
                left_command = format_command(value_omega_left)
                right_command = format_command(value_omega_right)
                control_send = f"V,{left_command},{right_command}"

                try:
                    control_send = f"V,{left_command},{right_command}"
                    serial_port.write(control_send.encode())
                    print(f"Dữ liệu gởi đến STM32: {control_send.encode()}")
                except serial.SerialException as e:
                    print(f"Error writing to serial port: {e}")
                    # Command to send STM32 
                print(f"Command to send STM32: {control_send}")
                #Tạo thông điệp Twist 
                twist_msg = geometry_msgs.msg.Twist()
                twist_msg.linear.x = linear_velocity_turned
                twist_msg.angular.z = angular_velocity_turned

                 # Gửi thông điệp Twist
                cmd_vel_pub.publish(twist_msg)
                print(f"Published to cmd_vel: linear.x={linear_velocity_turned}, angular.z={angular_velocity_turned}")
                
            elif key in speedBindings.keys():
                linear_velocity_origin = linear_velocity_origin * speedBindings[key][0]
                angular_velocity_origin = angular_velocity_origin * speedBindings[key][1]

                print(f"Speed: {linear_velocity_origin}, Turn: {angular_velocity_origin}")
    
            else: 
                x_origin =  0.0 #turn vận tốc ban đầu
                th_origin = 0.0  #turn tốc độ quay ban đầu  
                if key == '\x03':  # CTRL+C
                    break
    except Exception as e:
        print(e)
    finally:
        restoreTerminalSettings(settings)
        rclpy.shutdown()

if __name__ == '__main__':
    main()
