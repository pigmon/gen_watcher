#include <iostream>
#include <ros/ros.h>
#include "monitor_py/all_state.h"

const unsigned char NO_ERR   = 0;
const unsigned char VALUE_LD = 1;
const unsigned char VALUE_GD = 2;
const unsigned char NO_VALUE = 3;

struct Monitor
{
    unsigned char m_hz_gps      :2;
    unsigned char m_param_gps   :2;
    unsigned char m_hz_imu      :2;
    unsigned char m_param_imu   :2;
    unsigned char m_hz_lidar    :2;
    unsigned char m_param_lidar :2;
    unsigned char m_hz_radar    :2;
    unsigned char m_param_radar :2;

    void Print()
    {
        printf ("%d, %d, %d, %d, %d, %d, %d, %d\n", 
            m_hz_gps, m_param_gps, m_hz_imu, m_param_imu, m_hz_lidar, 
            m_param_lidar, m_hz_radar, m_param_radar);
    }

    void CalcuGPS(const double _hz_real, const double _hz_min, const double _hz_max, 
        const double _value_real, const double _min, const double _max)
    {
        m_hz_gps = (_hz_real < 0) ? NO_VALUE : ((_hz_real > _hz_max) ? VALUE_GD : ((_hz_real < _hz_min) ? VALUE_LD : NO_ERR));
        m_param_gps = (_hz_real < 0) ? NO_VALUE : ((_value_real > _max) ? VALUE_GD : ((_value_real < _min) ? VALUE_LD : NO_ERR));
    }

    void CalcuIMU(const double _hz_real, const double _hz_min, const double _hz_max, 
        const double _value_real, const double _min, const double _max)
    {
        m_hz_imu = (_hz_real < 0) ? NO_VALUE : ((_hz_real > _hz_max) ? VALUE_GD : ((_hz_real < _hz_min) ? VALUE_LD : NO_ERR));
        m_param_imu = (_hz_real < 0) ? NO_VALUE : ((_value_real > _max) ? VALUE_GD : ((_value_real < _min) ? VALUE_LD : NO_ERR));
    }
};

Monitor obj_monitor;

void msg_callback(const monitor_py::all_state &msg)
{
    std::cout << "--------------------\n";
    for (auto it = msg.states.begin(); it != msg.states.end(); it++)
    {
        std::cout << it->msg_name << ":\n";
        std::cout << "Topic sequence in hz: " << it->hz << std::endl;
        std::cout << "Topic sequence min: " << (int)it->hz_min << std::endl;
        std::cout << "Topic sequence max: " << (int)it->hz_max << std::endl;
        std::cout << "Watching param name: " << it->param_name << std::endl;
        std::cout << "Param value: " << it->param_value << std::endl;
        std::cout << "Param Min: " << (int)it->param_min << std::endl;
        std::cout << "Param Max: " << (int)it->param_max << std::endl;

        if (it->msg_name == "/gps")
        {
            obj_monitor.CalcuGPS(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
        else if (it->msg_name == "/imu/data")
        {
            obj_monitor.CalcuIMU(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
    }

    obj_monitor.Print();
}

int main(int argc,char ** argv)
{
    ros::init(argc,argv,"test_sub");
    ros::NodeHandle n;
    ros::Subscriber msg_sub = n.subscribe("node_states", 100, msg_callback);

    ros::spin();

    return 0;
}