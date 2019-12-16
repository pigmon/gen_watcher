# 北汽项目分支
## 1. 简述
原本用于HMI2.0项目中的监控程序生成工具的北汽项目分支。分支名：beiqi

github 地址：
https://github.com/pigmon/gen_watcher.git

clone 命令：
```shell
git clone -b beiqi https://github.com/pigmon/gen_watcher.git
```

## 1.1 使用流程
 - 修改配置文件 watch.ini，配置需要监听的Topic，该Topic中监视的成员，以及它们的参考值（正常值范围）
 - 运行代码生成程序 test_gen.py (北汽车辆工控机命令：python2 test_gen.py)
 - 运行自动生成的程序 gen.py (北汽车辆工控机命令：python2 gen.py)
 - 接收名为 node_states 的 Topic 并使用监控结果
 
## 2. 配置文件说明
#### 12月16日更新 修改 CHECKING_SIZE 为 CHECKING_TYPE; 增加 ARR_NAME
```ini
[lidar]
SOURCE_FILE=                           # 暂时没用
PACKAGE=gen_watcher_msgs               # 消息包名，用于生成包含头文件的程序
MSG=arr_test                           # 消息类型名
MSG_NAKE_NAME=/arr_num                 # 消息名
CHECKING_PARAM=num                     # 要监视的消息成员
CHECKING_VALUE=int64,1,1000            # 受监视成员正常值的最小值，最大值 
CHECKING_TYPE=2                        # 0 - 检查参数值; 1 - 检查参数size；2 - 检查ARR_NAME中的数组
HZ_RANGE=9,1000                        # 消息广播频率正常值的最小值，最大值
ARR_NAME=numbers                       # 检查的数组名
```

## 3. 消息格式说明
#### 12月16日更新 增加 extra
使用时只需接收 all_state.msg，它的定义如下：
```python
Header header
node_state[] states
```
其中，states 数组是所有被监控消息的数组，类型是 node_state。node_state 的定义在 node_state.msg中：
```python
# 一个监视消息的数据
string msg_name         # 消息名
float64 hz              # 实时统计的消息频率
float64 hz_min          # 配置文件中设置的频率最低值
float64 hz_max          # 配置文件中设置的频率最大值
string param_name       # 监视的参数名
float64 param_value     # 实时获取的参数值 （或 size）
float64 param_min       # 配置文件中设置的参数值（或 size）的最小值
float64 param_max       # 配置文件中设置的参数值（或 size）的最大值
float64[] extra         # 只有在配置文件CHECKING_TYPE==2时才生效的检查数组名
```

## 4. C++ 端接收解析
例子程序位于：src\gen_watcher\src\test_sub.cpp
按照目前商讨的结果，接收到消息后，会将结果统计为一个只包含各个模块状态变量的结构体中，并需要有将结构体编码成64位以内的报文的功能。

状态变量取值范围：int[0,3]
0：无错误
1：值过小
2：值过大
3：没有得到值

例子中包含以下主要示范：
- 结构体定义；
- 在订阅 node_states 消息的 callback 中刷新结构体数值；
- 自动将结构体变量编码成32位整数；
- 从32位整数解码成结构体变量（上一条的逆运算）；

代码文档请参考：
https://github.com/pigmon/gen_watcher/blob/beiqi/rospy_test/src/gen_watcher/src/readme.md

## 5. 监控内容 （2019年12月11日更新）
### 5.1 GPS
Topic: /gps;
频率：30 以上;
监控参数：待定;
### 5.2 惯导
Topic：/imu/data;
频率：30以上;
监控参数：待定;
### 5.3 激光雷达
Topic：/rslidar_points;
频率：9 以上;
监控参数：size of data;
参数范围：2,000,000 以上;
### 5.4 摄像头（视觉）
Topic：/Flir/image_raw;
频率：58 以上;
监控参数：width;
参数范围：1024,2048;
