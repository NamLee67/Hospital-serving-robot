//// #include "NavigationSender.h"
//// #include <rclcpp/rclcpp.hpp>
//// #include <geometry_msgs/msg/pose_stamped.hpp>

//// NavigationSender::RosNode::RosNode() : Node("navigation_sender") {
////     publisher_ = this->create_publisher<geometry_msgs::msg::PoseStamped>("/goal_pose", 10);
////     RCLCPP_INFO(this->get_logger(), "ROS2 Node initialized");
//// }

//// void NavigationSender::RosNode::publish_goal(double x, double y, double z, double qx, double qy, double qz, double qw) {
////     geometry_msgs::msg::PoseStamped msg;
////     msg.header.stamp = this->get_clock()->now();
////     msg.header.frame_id = "map";

////     msg.pose.position.x = x;
////     msg.pose.position.y = y;
////     msg.pose.position.z = z;
////     msg.pose.orientation.x = qx;
////     msg.pose.orientation.y = qy;
////     msg.pose.orientation.z = qz;
////     msg.pose.orientation.w = qw;

////     publisher_->publish(msg);
////     RCLCPP_INFO(this->get_logger(), "Sent goal to: (%f, %f)", x, y);
//// }

//// NavigationSender::NavigationSender(QObject *parent) : QObject(parent) {
////     // Khởi tạo ROS2
////     if (!rclcpp::ok()) {
////         rclcpp::init(0, nullptr);
////     }

////     // Tạo node ROS2
////     ros_node_ = std::make_shared<RosNode>();

////     // Chạy ROS2 spin trong luồng riêng
////     auto spin = [this]() { rclcpp::spin(ros_node_); };
////     QObject::connect(&ros_thread_, &QThread::started, spin);
////     ros_thread_.start();
//// }

//// NavigationSender::~NavigationSender() {
////     // Dọn dẹp
////     ros_thread_.quit();
////     ros_thread_.wait();
////     rclcpp::shutdown();
//// }

//// void NavigationSender::sendGoal(double x, double y, double z, double qx, double qy, double qz, double qw) {
////     ros_node_->publish_goal(x, y, z, qx, qy, qz, qw);
//// }
//#include "NavigationSender.h"
//#include <rclcpp/rclcpp.hpp>
//#include <geometry_msgs/msg/twist.hpp>
//#include <QObject>

//NavigationSender::RosNode::RosNode(NavigationSender* parent)
//    : Node("navigation_sender_node"), parent_(parent) {
//    publisher_ = this->create_publisher<geometry_msgs::msg::PoseStamped>("/goal_pose", 10);
//    subscriber_ = this->create_subscription<geometry_msgs::msg::Twist>(
//        "/cmd_vel_nav", 10, std::bind(&RosNode::velocity_callback, this, std::placeholders::_1));
//    RCLCPP_INFO(this->get_logger(), "ROS2 Node initialized");
//}

//void NavigationSender::RosNode::publish_goal(double x, double y, double z, double qx, double qy, double qz, double qw) {
//    geometry_msgs::msg::PoseStamped msg;
//    msg.header.stamp = this->get_clock()->now();
//    msg.header.frame_id = "map";

//    msg.pose.position.x = x;
//    msg.pose.position.y = y;
//    msg.pose.position.z = z;
//    msg.pose.orientation.x = qx;
//    msg.pose.orientation.y = qy;
//    msg.pose.orientation.z = qz;
//    msg.pose.orientation.w = qw;
//    publisher_->publish(msg);
//    RCLCPP_INFO(this->get_logger(), "Sent goal to: (%f, %f)", x, y);
//}

//void NavigationSender::RosNode::velocity_callback(const geometry_msgs::msg::Twist::SharedPtr msg) {
//    if (parent_) {
//        parent_->robot_speed_ = msg->linear.x; // Update robot speed
//        emit parent_->velocityUpdated(msg->linear.x); // Emit signal
//        RCLCPP_INFO(this->get_logger(), "Sending...");
//    }
//    RCLCPP_INFO(this->get_logger(), "Received velocity: linear.x=%f", msg->linear.x);
//}

//NavigationSender::NavigationSender(QObject *parent) : QObject(parent), robot_speed_(0.0) {
//    if (!rclcpp::ok()) {
//        rclcpp::init(0, nullptr);
//    }
//    ros_node_ = std::make_shared<RosNode>(this);
//    auto spin = [this]() { rclcpp::spin(ros_node_); };
//    QObject::connect(&ros_thread_, &QThread::started, spin);
//    ros_thread_.start();
//}

//NavigationSender::~NavigationSender() {
//    ros_thread_.quit();
//    ros_thread_.wait();
//    rclcpp::shutdown();
//}

//void NavigationSender::sendGoal(double x, double y, double z, double qx, double qy, double qz, double qw) {
//    ros_node_->publish_goal(x, y, z, qx, qy, qz, qw);
//}
