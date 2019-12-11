# 北汽项目分支
## 1. 简述
原本用于HMI2.0项目中的监控程序生成工具的北汽项目分支。分支名：beiqi

github 地址：
https://github.com/pigmon/gen_watcher.git

clone 命令：
```shell
git clone -b beiqi 
```

## 1.1 使用流程
 - 修改配置文件 watch.ini，配置需要监听的Topic，该Topic中监视的成员，以及它们的参考值（正常值范围）
 - 运行代码生成程序 test_gen.py (北汽车辆工控机命令：python2 test_gen.py)
 - 运行自动生成的程序 gen.py (北汽车辆工控机命令：python2 gen.py)
 - 接收名为 node_states 的 Topic 并使用监控结果
 
## 2. 配置文件说明
```ini
[lidar]
SOURCE_FILE=                           # 暂时没用
PACKAGE=sensor_msgs                    # 消息包名，用于生成包含头文件的程序
MSG=PointCloud2                        # 消息类型名
MSG_NAKE_NAME=/rslidar_points          # 消息名
CHECKING_PARAM=data                    # 要监视的消息成员
CHECKING_VALUE=int64,2000000,3000000   # 受监视成员正常值的最小值，最大值 
CHECKING_SIZE=1                        # 1 - 检查参数size；0 - 检查参数值
HZ_RANGE=9,1000                        # 消息广播频率正常值的最小值，最大值
```

## 3. 消息格式说明
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
```

## 4. C++ 端接收解析

