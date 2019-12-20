/*
 * 北汽项目临时增加的中转层。
 * <Yuan Sheng 2019.12.19>
 * 1. 接收 /scene 和 /gps/odom，得到车辆与当前路径的最短距离，用于判断路径偏离。
 * 最终发出消息 monitor_info
 */

#include <iostream>
#include <ros/ros.h>
#include <nox_msgs/Scene.h>
#include <nav_msgs/Odometry.h>
#include <gen_watcher_msgs/info.h>

ros::Publisher pubber;

double CurrentX, CurrentY;
double CurrentDistance = 0;

void process_pub(const ros::TimerEvent &_evt)
{
    gen_watcher_msgs::info msg;
    msg.header.stamp = ros::Time::now();
    msg.header.frame_id = "imu_base";
    msg.err_dist = CurrentDistance;

    pubber.publish(msg);
}

void scene_callback(const nox_msgs::Scene::ConstPtr &msg)
{
    double X = CurrentX;
    double Y = CurrentY;
    double min_manhattan = 1024;
    double ref_x, ref_y;

    //1. 用曼哈顿距离得到最近点的x,y
    size_t len = msg->guideLines.size();
    for (size_t i = 0; i < len; i++)
    {
        //ROS_INFO("scene guidline No. %ld:", i);
        size_t point_len = msg->guideLines[i].path.points.size();
        for (size_t j = 0; j < point_len; j++)
        {
            double x = msg->guideLines[i].path.points[j].pose.position.x;
            double y = msg->guideLines[i].path.points[j].pose.position.y;

            double dist_mht = fabs(X - x) + fabs(Y - y);
            if (dist_mht < min_manhattan)
            {
                ref_x = x;
                ref_y = y;
                min_manhattan = dist_mht;
            }             
        }
    }

    //2. 用欧式距离算出最近点和车的距离
    CurrentDistance = sqrt((X - ref_x) * (X - ref_x) + (Y - ref_y) * (Y - ref_y));
    //ROS_INFO("Nearest point is distance: %f", CurrentDistance);
}

void gps_odom_callback(const nav_msgs::Odometry::ConstPtr &msg)
{
    CurrentX = msg->pose.pose.position.x;
    CurrentY = msg->pose.pose.position.y;
}

int main(int argc,char ** argv)
{
    ros::init(argc,argv,"location_node");

    ros::NodeHandle n;
    // publish
    pubber = n.advertise<gen_watcher_msgs::info>("monitor_info", 1000);
    ros::Timer timer = n.createTimer(ros::Duration(1.0), process_pub);
    // subscribe
    ros::Subscriber msg_sub = n.subscribe("/scene", 1, scene_callback);
    ros::Subscriber msg_sub2 = n.subscribe("/gps/odom", 1, gps_odom_callback);

    ros::spin();

    return 0;
}