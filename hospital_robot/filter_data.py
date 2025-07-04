import re

def process_twist_data(input_file_path, output_file_path, time_step=0.1):
    """
    Đọc dữ liệu Twist từ file đầu vào, trích xuất linear.x và angular.z,
    và ghi vào file đầu ra với định dạng thời gian,linear.x,angular.z.

    Args:
        input_file_path (str): Đường dẫn đến file chứa dữ liệu Twist (ví dụ: 'input_data.txt').
        output_file_path (str): Đường dẫn đến file đầu ra (ví dụ: 'output_data.txt').
        time_step (float): Khoảng thời gian giả định giữa các mẫu dữ liệu (giây).
    """
    linear_x_pattern = re.compile(r'^\s*x:\s*(-?\d+\.\d+(?:e[-+]?\d+)?)$')
    angular_z_pattern = re.compile(r'^\s*z:\s*(-?\d+\.\d+(?:e[-+]?\d+)?)$')

    current_time = 0.0
    output_lines = []
    
    # Biến trạng thái để biết đang đọc phần linear hay angular
    reading_linear = False
    reading_angular = False
    
    # Biến tạm thời để lưu giá trị x và z của thông báo hiện tại
    current_linear_x = None
    current_angular_z = None

    try:
        with open(input_file_path, 'r') as infile:
            for line in infile:
                line = line.strip() # Xóa khoảng trắng đầu cuối và ký tự xuống dòng

                if line == 'linear:':
                    reading_linear = True
                    reading_angular = False # Đảm bảo reset trạng thái
                    current_linear_x = None # Reset x cho thông báo mới
                    current_angular_z = None # Reset z cho thông báo mới
                elif line == 'angular:':
                    reading_angular = True
                    reading_linear = False
                elif line == '---': # Dấu phân tách thông báo
                    if current_linear_x is not None and current_angular_z is not None:
                        output_lines.append(f"{current_time},{current_linear_x},{current_angular_z}")
                        current_time += time_step
                    # Reset cho thông báo tiếp theo
                    reading_linear = False
                    reading_angular = False
                    current_linear_x = None
                    current_angular_z = None
                else:
                    if reading_linear:
                        match = linear_x_pattern.match(line)
                        if match:
                            current_linear_x = float(match.group(1))
                    elif reading_angular:
                        match = angular_z_pattern.match(line)
                        if match:
                            current_angular_z = float(match.group(1))
        
        # Xử lý thông báo cuối cùng nếu file không kết thúc bằng '---'
        if current_linear_x is not None and current_angular_z is not None:
            output_lines.append(f"{current_time},{current_linear_x},{current_angular_z}")


        with open(output_file_path, 'w') as outfile:
            for out_line in output_lines:
                outfile.write(out_line + '\n')
        
        print(f"Dữ liệu đã được xử lý và lưu vào '{output_file_path}'")
        print(f"Tổng số bản ghi: {len(output_lines)}")

    except FileNotFoundError:
        print(f"Lỗi: Không tìm thấy file đầu vào tại '{input_file_path}'")
    except Exception as e:
        print(f"Đã xảy ra lỗi trong quá trình xử lý file: {e}")

# --- Cấu hình đường dẫn và chạy script ---
if __name__ == '__main__':
    # Đường dẫn đến file chứa dữ liệu Twist đầu vào của bạn
    input_data_file = '/home/huuhoa/hospital_robot/data_vel1.txt' 
    
    # Đường dẫn đến file đầu ra mà bạn muốn lưu dữ liệu đã lọc
    output_data_file = '/home/huuhoa/hospital_robot/data_vel1_filted.txt' 
    
    # Khoảng thời gian giả định giữa mỗi bản ghi (ví dụ: 0.1 giây)
    # Bạn có thể thay đổi giá trị này tùy theo tần suất bạn muốn các điểm dữ liệu xuất hiện
    time_step_interval = 0.1 

    process_twist_data(input_data_file, output_data_file, time_step_interval)
