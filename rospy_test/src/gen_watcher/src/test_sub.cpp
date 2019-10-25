#include <iostream>
#include <ros/ros.h>
#include "rospy_test/all_state.h"

void msg_callback(const rospy_test::all_state &msg)
{
    std::cout << "--------------------\n";
    for (auto it = msg.states.begin(); it != msg.states.end(); it++)
    {
        std::cout << it->msg_name << ":\n";
        std::cout << "Topic sequence in hz: " << it->hz << std::endl;
        std::cout << "Topic sequence state: " << (int)it->hz_state << std::endl;
        std::cout << "Watching param name: " << it->param_name << std::endl;
        std::cout << "Param value: " << it->param_value << std::endl;
        std::cout << "Param State: " << (int)it->param_state << std::endl;
    }
}

int main(int argc,char ** argv)
{
    ros::init(argc,argv,"test_sub");
    ros::NodeHandle n;
    ros::Subscriber msg_sub = n.subscribe("node_states", 100, msg_callback);

    ros::spin();
    return 0;
}