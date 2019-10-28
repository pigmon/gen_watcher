# gen_watcher
## 1. 简述
本模块用于HMI2.0中，独立于HMI核心程序，根据配置文件自动生成监控后台ROS节点消息状态的程序，并将监控结果使用ROS Topic进行广播。
监控内容包括 Topic 的实时发送频率，其中某个成员的实时数值，以及根据事先在配置文件中设定的参考取值范围判断的状态结果。

github 地址：
https://github.com/pigmon/gen_watcher.git
## 1.1 使用流程
 - 修改配置文件 watch.ini，配置需要监听的Topic，该Topic中监视的成员，以及它们的参考值（正常值范围）
 - 运行代码生成程序 test_gen.py
 - 运行自动生成的程序 gen.py
 - 接收名为 node_states 的 Topic 并使用监控结果
## 2. 配置文件说明
```ini
[check1]                                                        # Section 名字随意取，只要不重复
SOURCE_FILE=/home/pigmon/Workspace/rospy_test/devel/setup.sh    # 暂时没用
PACKAGE=rospy_test                                              # 暂时没用
MSG=Num                                                         # 消息名
MSG_NAKE_NAME=my_num                                            # 消息别名，在程序中 pub 时取的名字
CHECKING_PARAM=num                                              # 要监视的消息成员
CHECKING_VALUE=int64,1,2000000000                               # 受监视成员正常值的最小值，最大值
HZ_RANGE=8,12                                                   # 消息广播频率正常值的最小值，最大值
```
一旦监控到的频率和参数值超出配置文件中规定的正常值范围，all_states消息中相应的状态位就会置0（false），参考3.2 状态报告消息。

## 3. 消息格式说明
## 3.1 测试消息
工程中的 info.msg 和 Num.msg 是用来测试的，talker.py是广播这两个消息的测试程序，watcher.ini 中默认配置的也是这两个消息。
## 3.2 状态报告消息
使用时只需接收 all_state.msg，它的定义如下：
```c++
Header header
node_state[] states
```
其中，states 数组是所有被监控消息的数组，类型是 node_state。node_state 的定义在 node_state.msg中：
```c++
string msg_name         # 消息名
float64 hz              # 实时计算的消息频率
bool hz_state           # 实时频率与配置文件中定义的频率参考范围对比
string param_name       # 消息中监控数值的成员名
float64 param_value     # 实时获取的该参数的数值
bool param_state        # 实时数值与配置文件中参考值的对比结果
```

## 4. C++ 接收解析消息例子
```c++
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
```
