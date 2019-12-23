#include <iostream>
#include <bitset>
#include <ros/ros.h>
#include "gen_watcher_msgs/all_state.h"
#include "gen_watcher_msgs/info.h"

const unsigned char NO_ERR   = 0;
const unsigned char VALUE_LD = 1;
const unsigned char VALUE_GD = 2;
const unsigned char NO_VALUE = 3;

bool IsBigEndian();

typedef union 
{
    uint32_t EncodedInt;
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
        unsigned char m_hz_cam      :2;
        unsigned char m_param_cam   :2;
        unsigned char m_hz_bz       :2;
        unsigned char m_param_bz    :2;
        unsigned char m_hz_light    :2;
        unsigned char m_param_light :2;
        unsigned char m_hz_location  :2;
        unsigned char m_param_location  :2;

        void Print()
        {
            printf ("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n", 
                m_hz_gps, m_param_gps, m_hz_imu, m_param_imu, m_hz_lidar, 
                m_param_lidar, m_hz_radar, m_param_radar, m_hz_cam, m_param_cam, 
                m_hz_bz, m_param_bz);
        }

        void PrintBinInBigendian()
        {
            std::cout << std::bitset<2>(m_hz_gps) <<
                std::bitset<2>(m_param_gps) << 
                std::bitset<2>(m_hz_imu) << 
                std::bitset<2>(m_param_imu) << 
                std::bitset<2>(m_hz_lidar) << 
                std::bitset<2>(m_param_lidar) << 
                std::bitset<2>(m_hz_radar) << 
                std::bitset<2>(m_param_radar) << 
                std::bitset<2>(m_hz_cam) << 
                std::bitset<2>(m_param_cam) << 
                std::bitset<2>(m_hz_bz) << 
                std::bitset<2>(m_param_bz) << 
                std::bitset<2>(m_hz_light) << 
                std::bitset<2>(m_param_light) << 
                std::bitset<2>(m_hz_location) << 
                std::bitset<2>(m_param_location) << std::endl;
        }

        // 这个_big_endian指的是编码成整数那边的大小端，不一定是本地的。
        void FromEncodedInt(uint32_t _encoded, bool _big_endian)
        {
            if (_big_endian)
            {
                m_hz_gps = _encoded >> 30;
                m_param_gps = _encoded >> 28;
                m_hz_imu = _encoded >> 26;
                m_param_imu = _encoded >> 24;
                m_hz_lidar = _encoded >> 22;
                m_param_lidar = _encoded >> 20;
                m_hz_radar = _encoded >> 18;
                m_param_radar = _encoded >> 16;
                m_hz_cam = _encoded >> 14;
                m_param_cam = _encoded >> 12;
                m_hz_bz = _encoded >> 10;
                m_param_bz = _encoded >> 8;
                m_hz_light = _encoded >> 6;
                m_param_light = _encoded >> 4;
                m_hz_location = _encoded >> 2;
                m_param_location = _encoded;                
            }
            else 
            {
                m_hz_gps = _encoded;
                m_param_gps = _encoded >> 2;
                m_hz_imu = _encoded >> 4;
                m_param_imu = _encoded >> 6;
                m_hz_lidar = _encoded >> 8;
                m_param_lidar = _encoded >> 10;
                m_hz_radar = _encoded >> 12;
                m_param_radar = _encoded >> 14;
                m_hz_cam = _encoded >> 16;
                m_param_cam = _encoded >> 18;
                m_hz_bz = _encoded >> 20;
                m_param_bz = _encoded >> 22;
                m_hz_light = _encoded >> 24;
                m_param_light = _encoded >> 26;
                m_hz_location = _encoded >> 28;
                m_param_location = _encoded >> 30;
            }
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

        void CalcuCAM(const double _hz_real, const double _hz_min, const double _hz_max, 
            const double _value_real, const double _min, const double _max)
        {
            m_hz_cam = (_hz_real < 0) ? NO_VALUE : ((_hz_real > _hz_max) ? VALUE_GD : ((_hz_real < _hz_min) ? VALUE_LD : NO_ERR));
            m_param_cam = (_hz_real < 0) ? NO_VALUE : ((_value_real > _max) ? VALUE_GD : ((_value_real < _min) ? VALUE_LD : NO_ERR));
        }

        void CalcuLidar(const double _hz_real, const double _hz_min, const double _hz_max, 
            const double _value_real, const double _min, const double _max)
        {
            m_hz_lidar = (_hz_real < 0) ? NO_VALUE : ((_hz_real > _hz_max) ? VALUE_GD : ((_hz_real < _hz_min) ? VALUE_LD : NO_ERR));
            m_param_lidar = (_hz_real < 0) ? NO_VALUE : ((_value_real > _max) ? VALUE_GD : ((_value_real < _min) ? VALUE_LD : NO_ERR));
        }

        void CalcuLight(const double _hz_real, const double _hz_min, const double _hz_max, 
            std::vector<double> _extra_array, const double _min, const double _max)
        {
            m_hz_light = (_hz_real < 0) ? NO_VALUE : ((_hz_real > _hz_max) ? VALUE_GD : ((_hz_real < _hz_min) ? VALUE_LD : NO_ERR));

            m_param_light = 0;
            for (size_t i = 0; i < _extra_array.size(); i++)
            {
                if (_extra_array[i] < _min || _extra_array[i] > _max)
                {
                    m_param_light = 3;
                    break;
                }
            }
        }

        void CalcuLocation(const double _hz_real, const double _hz_min, const double _hz_max, 
            const double _value_real, const double _min, const double _max)
        {
            m_hz_location = (_hz_real < 0) ? NO_VALUE : ((_hz_real > _hz_max) ? VALUE_GD : ((_hz_real < _hz_min) ? VALUE_LD : NO_ERR));
            m_param_location = (_hz_real < 0) ? NO_VALUE : ((_value_real > _max) ? VALUE_GD : ((_value_real < _min) ? VALUE_LD : NO_ERR));
        }
    } struct_monitor;

    
} Monitor;

bool IsBigEndian()
{
    union 
    {
        short num;
        char arr[2];
    } test;
    test.num = 0x1234;

    return test.arr[0] == 0x12;
}


Monitor obj_monitor;

void msg_callback(const gen_watcher_msgs::all_state::ConstPtr &msg)
{
    std::cout << "--------------------\n";
    for (auto it = msg->states.begin(); it != msg->states.end(); it++)
    {
        // std::cout << it->msg_name << ":\n";
        // std::cout << "Topic sequence in hz: " << it->hz << std::endl;
        // std::cout << "Topic sequence min: " << (int)it->hz_min << std::endl;
        // std::cout << "Topic sequence max: " << (int)it->hz_max << std::endl;
        // std::cout << "Watching param name: " << it->param_name << std::endl;
        // std::cout << "Param value: " << it->param_value << std::endl;
        // std::cout << "Param Min: " << (int)it->param_min << std::endl;
        // std::cout << "Param Max: " << (int)it->param_max << std::endl;

        if (it->msg_name == "/gps")
        {
            obj_monitor.struct_monitor.CalcuGPS(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
        else if (it->msg_name == "/imu/data")
        {
            obj_monitor.struct_monitor.CalcuIMU(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
        else if (it->msg_name == "/Flir/image_raw")
        {
            obj_monitor.struct_monitor.CalcuCAM(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
        else if (it->msg_name == "/rslidar_points")
        {
            obj_monitor.struct_monitor.CalcuLidar(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
        else if (it->msg_name == "/traffic_light_state")
        {
            obj_monitor.struct_monitor.CalcuLight(it->hz, it->hz_min, it->hz_max, it->extra, it->param_min, it->param_max);
        }
        else if (it->msg_name == "/monitor_info")
        {
            obj_monitor.struct_monitor.CalcuLocation(it->hz, it->hz_min, it->hz_max, it->param_value, it->param_min, it->param_max);
        }
    }

    std::cout << "Struct Value in Bigendian: \n"; 
    obj_monitor.struct_monitor.PrintBinInBigendian();
    std::cout << "Encoded Int Value : (Is Bigendian" << IsBigEndian() << ")\n";
    std::cout << std::bitset<32>(obj_monitor.EncodedInt) << std::endl;
}

int main(int argc,char ** argv)
{
    ros::init(argc,argv,"test_sub");
    ros::NodeHandle n;
    ros::Subscriber msg_sub = n.subscribe("node_states", 100, msg_callback);

    //std::cout << "size of Monitor: " << sizeof(Monitor) << std::endl;

    ros::spin();

    return 0;
}