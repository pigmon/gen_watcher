# C++ 示范程序代码文档
## 1. 简述
北汽项目，监控程序生成模块，C++端接收示范。
### 1.1 使用注意事项
一旦修改 Monitor 这个联合体内任何内容，需要同步修改本项目中的 test_sub.cpp 并提交；
## 2. 主要内容
- 用于存储所有被监控模块状态变量的结构体定义；
- 在接收 node_states 消息的回调函数中填充结构体变量数值的方法；
- 自动将结构体变量编码成 32 位无符号整数；
- 用已编码的 32 位无符号整数更新结构体变量的值；（跟上一条是逆运算）
- Debug 用的一些函数；
## 3. 结构体说明
结构体声明：
```c++
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
        unsigned char m_place_holder_2  :2;
        unsigned char m_place_holder_3  :2;
} struct_monitor;
```
每相邻两个状态量针对一个模块，分别是频率状态和监视参数状态。从变量名容易看出监视内容。
### 3.1 命名说明
- m_hz_ 前缀代表频率检查状态，m_param_ 前缀代表参数检查状态
- gps，imu-惯导，lidar-激光雷达，radar-毫米波雷达，cam-摄像头，bz-盲区, light-交通灯
### 3.2 取值范围
每个状态量占2位，即取值范围是0,1,2,3这4个值，其中：
- 0 - 无错误；
- 1 - 值过小；
- 2 - 值过大；
- 3 - 没有取到值；

最后4个变量暂时（12月11日）没用，会保持0值。

## 4. 编码 32 位无符号整数
目前采用的方法是用一个 32 位无符号整数与结构体组成一个联合体共享内存，这样在更新了结构体变量的值后，编码自动完成。即：
```c++
typedef union
{
    uint32_t EncodedInt;
    struct Monitor { ... } struct_monitor;
} Monitor;
```

## 5. 从 32 位无符号整数解码
参考 struct_monitor 里的函数 FromEncodedInt，具体说明如下：
#### _encoded：
传入参数，已经编码好的 32 位无符号整数。
#### _big_endian：
传入的 32 位无符号整数是否是 big endian，
注意不是本机是否big endian，而是编码这个整数的机器。
```c++
void FromEncodedInt(uint32_t _encoded, bool _big_endian)
```

## 6. 主要函数说明
### 6.1 msg_callback
订阅 node_states 消息的回调函数，其内容作为直接订阅工控机广播的 node_states 消息的参考。
### 6.2 bool IsBigEndian
判断本机是否 Big Endian。是则返回 true，否则 false。
### 6.3 Monitor.struct_monitor.Print
以正常10进制依次输出结构体变量内的状态变量值，提供给人直接阅读。
### 6.4 Monitor.struct_monitor.PrintBinInBigendian
以 Big Endian 依次打印结构体中所有状态量的2进制数值，用于与编码的 32 位无符号整数对比。
### 6.5 Monitor.struct_monitor.FromEncodedInt
见第 5 部分说明。
### 6.6 Monitor.struct_monitor.CalcuGPS
用于在 msg_callback 中，接收到消息后更新 m_hz_gps 和 m_param_gps，参考 msg_callback 函数。
### 6.7 Monitor.struct_monitor.CalcuIMU
用于在 msg_callback 中，接收到消息后更新 m_hz_imu 和 m_param_imu，参考 msg_callback 函数。
### 6.8 Monitor.struct_monitor.CalcuCAM
用于在 msg_callback 中，接收到消息后更新 m_hz_cam 和 m_param_cam，参考 msg_callback 函数。
### 6.9 Monitor.struct_monitor.CalcuLidar
用于在 msg_callback 中，接收到消息后更新 m_hz_lidar 和 m_param_lidar，参考 msg_callback 函数。
### 6.10 Monitor.struct_monitor.CalcuLight
用于在 msg_callback 中，接收到消息后更新 m_hz_light 和 m_param_light，参考 msg_callback 函数。
