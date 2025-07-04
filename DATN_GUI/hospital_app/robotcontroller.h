#ifndef ROBOTCONTROLLER_H
#define ROBOTCONTROLLER_H

#include <QObject>
#include <rclcpp/rclcpp.hpp>
#include <geometry_msgs/msg/pose_stamped.hpp>
#include <QObject>
#include <QThread>

class robotcontroller : public QObject
{
    Q_OBJECT
public:
    explicit robotcontroller(QObject *parent = nullptr);
    ~robotcontroller();
public slots:
    void sendGoal(double x, double y, double z, double qx, double qy, double qz, double qw);

private:
    class RosNode : public rclcpp::Node {
    public:
        RosNode();
        void publish_goal(double x, double y, double z, double qx, double qy, double qz, double qw);
    private:
        rclcpp::Publisher<geometry_msgs::msg::PoseStamped>::SharedPtr publisher_;
    };

    std::shared_ptr<RosNode> ros_node_;
    QThread ros_thread_;:

};

#endif // ROBOTCONTROLLER_H
