//#ifndef NAVIGATIONSENDER_H
//#define NAVIGATIONSENDER_H

//#include <rclcpp/rclcpp.hpp>
//#include <geometry_msgs/msg/pose_stamped.hpp>
//#include <geometry_msgs/msg/twist.hpp>
//#include <QObject>
//#include <QThread>

//class NavigationSender : public QObject {
//    Q_OBJECT
//    Q_PROPERTY(float robotSpeed READ robotSpeed NOTIFY velocityUpdated)
//public:
//    explicit NavigationSender(QObject *parent = nullptr);
//    ~NavigationSender();
//    float robotSpeed() const { return robot_speed_; }

//public slots:
//    void sendGoal(double x, double y, double z, double qx, double qy, double qz, double qw);
//signals:
//	void velocityUpdated(double vel);
    

//private:
//    class RosNode : public rclcpp::Node {
//    public:
//        RosNode(NavigationSender* parent);
//        void publish_goal(double x, double y, double z, double qx, double qy, double qz, double qw);
//        void velocity_callback(const geometry_msgs::msg::Twist::SharedPtr msg);
//    private:
//        rclcpp::Publisher<geometry_msgs::msg::PoseStamped>::SharedPtr publisher_;
//        rclcpp::Subscription<geometry_msgs::msg::Twist>::SharedPtr subscriber_;
//        NavigationSender* parent_;
//    };

//    std::shared_ptr<RosNode> ros_node_;
//    QThread ros_thread_;
//    float robot_speed_;
//};

//#endif // NAVIGATIONSENDER_H
