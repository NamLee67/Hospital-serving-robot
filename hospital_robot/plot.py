import matplotlib.pyplot as plt
import csv
import os

def plot_robot_velocity_data(file_path):
    """
    Đọc dữ liệu vận tốc robot từ file và vẽ biểu đồ.

    Args:
        file_path (str): Đường dẫn đầy đủ đến file dữ liệu (ví dụ: '/home/huuhoa/hospital_robot/data.txt').
    """
    timestamps = []
    linear_x_data = []
    angular_z_data = []

    # Kiểm tra xem file có tồn tại không trước khi cố gắng mở
    if not os.path.exists(file_path):
        print(f"Lỗi: Không tìm thấy file tại đường dẫn '{file_path}'")
        print("Vui lòng kiểm tra lại đường dẫn và tên file.")
        return

    try:
        with open(file_path, 'r') as file:
            # Sử dụng csv.reader nếu dữ liệu phân tách bằng dấu phẩy
            # Nếu dữ liệu của bạn phân tách bằng dấu cách, hãy bỏ comment dòng dưới và comment dòng 'reader = csv.reader(file)'
            reader = csv.reader(file) 
            # for line in file:
            #     row = line.strip().split() # Tách dòng bằng dấu cách

            # next(reader) # Bỏ comment dòng này nếu file data.txt của bạn có dòng tiêu đề (header)

            for row in reader:
                if len(row) == 3: # Đảm bảo mỗi dòng có đủ 3 cột dữ liệu
                    try:
                        timestamps.append(float(row[0]))
                        linear_x_data.append(float(row[1]))
                        angular_z_data.append(float(row[2]))
                    except ValueError:
                        print(f"Cảnh báo: Bỏ qua dòng không hợp lệ (không phải số): {row}")
                        continue
                else:
                    print(f"Cảnh báo: Bỏ qua dòng có định dạng không đúng (không đủ 3 cột): {row}")
                    
    except Exception as e:
        print(f"Đã xảy ra lỗi khi đọc file: {e}")
        return

    if not timestamps:
        print("Không có dữ liệu nào được đọc thành công để vẽ biểu đồ. Hãy kiểm tra lại nội dung file data.txt.")
        return

    # --- Vẽ biểu đồ ---
    plt.figure(figsize=(12, 8))

    # Biểu đồ 1: Vận tốc tuyến tính (linear.x) theo thời gian
    plt.subplot(2, 1, 1)
    plt.plot(timestamps, linear_x_data, label='Vận tốc tuyến tính (linear.x)', color='blue')
    plt.title('Vận tốc Robot theo Thời gian')
    plt.xlabel('Thời gian (s)')
    plt.ylabel('Vận tốc (m/s)')
    plt.grid(True)
    plt.legend()

    # Biểu đồ 2: Vận tốc góc (angular.z) theo thời gian
    plt.subplot(2, 1, 2)
    plt.plot(timestamps, angular_z_data, label='Vận tốc góc (angular.z)', color='red')
    plt.xlabel('Thời gian (s)')
    plt.ylabel('Vận tốc góc (rad/s)')
    plt.grid(True)
    plt.legend()

    plt.tight_layout()
    plt.show()

if __name__ == '__main__':

    data_file_path = '/home/huuhoa/hospital_robot/data_vel1_filted.txt' 
    plot_robot_velocity_data(data_file_path)
