#!/usr/bin/env python
# -*- coding:utf-8 -*-

# 注意：这是自动生成的程序，请不要做任何修改！

import rospy
import time
from std_msgs.msg import Header
from rostopic import ROSTopicHz
from gen_watcher_msgs.msg import node_state
from gen_watcher_msgs.msg import all_state
from sensor_msgs.msg import Imu
from sensor_msgs.msg import NavSatFix
from sensor_msgs.msg import Image
from sensor_msgs.msg import PointCloud2
from gen_watcher_msgs.msg import arr_test
from gen_watcher_msgs.msg import info

hz_checker = ROSTopicHz(10, use_wtime=True)

msg_dict = {}
msg_keys = ['msg', 'hz', 'hz_min', 'hz_max', 'param', 'param_value', 'param_min', 'param_max', 'extra']
pub = rospy.Publisher('node_states', all_state, queue_size = 10)

def func_checking_value(param, min, max):
	return param <= max and param >= min

def timer_callback(event):
	global hz_checker
	global pub

	node_msg = []

	ret = hz_checker.get_hz('/imu/data')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/imu/data']['hz'] = ret[0]
	else:
		msg_dict['/imu/data']['hz'] = -1

	if msg_dict['/imu/data']['hz'] <= 0:
		msg_dict['/imu/data']['param_value'] = -1024

	node_msg.append(node_state('/imu/data', msg_dict['/imu/data']['hz'], 30, 1000, 'linear_acceleration.x', msg_dict['/imu/data']['param_value'], 0.03, 10, msg_dict['/imu/data']['extra']))

	ret = hz_checker.get_hz('/gps')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/gps']['hz'] = ret[0]
	else:
		msg_dict['/gps']['hz'] = -1

	if msg_dict['/gps']['hz'] <= 0:
		msg_dict['/gps']['param_value'] = -1024

	node_msg.append(node_state('/gps', msg_dict['/gps']['hz'], 30, 1000, 'longitude', msg_dict['/gps']['param_value'], -180, 180, msg_dict['/gps']['extra']))

	ret = hz_checker.get_hz('/Flir/image_raw')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/Flir/image_raw']['hz'] = ret[0]
	else:
		msg_dict['/Flir/image_raw']['hz'] = -1

	if msg_dict['/Flir/image_raw']['hz'] <= 0:
		msg_dict['/Flir/image_raw']['param_value'] = -1024

	node_msg.append(node_state('/Flir/image_raw', msg_dict['/Flir/image_raw']['hz'], 58, 1000, 'width', msg_dict['/Flir/image_raw']['param_value'], 1200, 2048, msg_dict['/Flir/image_raw']['extra']))

	ret = hz_checker.get_hz('/rslidar_points')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/rslidar_points']['hz'] = ret[0]
	else:
		msg_dict['/rslidar_points']['hz'] = -1

	if msg_dict['/rslidar_points']['hz'] <= 0:
		msg_dict['/rslidar_points']['param_value'] = -1024

	node_msg.append(node_state('/rslidar_points', msg_dict['/rslidar_points']['hz'], 9, 1000, 'data', msg_dict['/rslidar_points']['param_value'], 2000000, 3000000, msg_dict['/rslidar_points']['extra']))

	ret = hz_checker.get_hz('/arr_num')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/arr_num']['hz'] = ret[0]
	else:
		msg_dict['/arr_num']['hz'] = -1

	if msg_dict['/arr_num']['hz'] <= 0:
		msg_dict['/arr_num']['param_value'] = -1024

	node_msg.append(node_state('/arr_num', msg_dict['/arr_num']['hz'], 9, 1000, 'num', msg_dict['/arr_num']['param_value'], 1, 1000, msg_dict['/arr_num']['extra']))

	ret = hz_checker.get_hz('/monitor_info')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/monitor_info']['hz'] = ret[0]
	else:
		msg_dict['/monitor_info']['hz'] = -1

	if msg_dict['/monitor_info']['hz'] <= 0:
		msg_dict['/monitor_info']['param_value'] = -1024

	node_msg.append(node_state('/monitor_info', msg_dict['/monitor_info']['hz'], 0, 1000, 'err_dist', msg_dict['/monitor_info']['param_value'], 0, 2, msg_dict['/monitor_info']['extra']))

	header = Header(stamp=rospy.Time.now())
	big_msg = all_state(header, node_msg)
	pub.publish(big_msg)

def sensor_msgs_Imu_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/imu/data')
	msg_dict['/imu/data']['param_value'] = msg.linear_acceleration.x

def sensor_msgs_NavSatFix_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/gps')
	msg_dict['/gps']['param_value'] = msg.longitude

def sensor_msgs_Image_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/Flir/image_raw')
	msg_dict['/Flir/image_raw']['param_value'] = msg.width

def sensor_msgs_PointCloud2_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/rslidar_points')
	msg_dict['/rslidar_points']['param_value'] = len(msg.data)

def gen_watcher_msgs_arr_test_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/arr_num')
	msg_dict['/arr_num']['extra'] = []
	for i in range(len(msg.numbers)):
		msg_dict['/arr_num']['extra'].append(msg.numbers[i].num)

def gen_watcher_msgs_info_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/monitor_info')
	msg_dict['/monitor_info']['param_value'] = msg.err_dist

def main():
	rospy.init_node('listener', anonymous=False)
	curr = rospy.get_rostime().to_sec()

	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/imu/data'
	msg_dict['/imu/data'] = sec_dict
	msg_dict['/imu/data']['param'] = 'linear_acceleration.x'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/gps'
	msg_dict['/gps'] = sec_dict
	msg_dict['/gps']['param'] = 'longitude'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/Flir/image_raw'
	msg_dict['/Flir/image_raw'] = sec_dict
	msg_dict['/Flir/image_raw']['param'] = 'width'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/rslidar_points'
	msg_dict['/rslidar_points'] = sec_dict
	msg_dict['/rslidar_points']['param'] = 'data'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/arr_num'
	msg_dict['/arr_num'] = sec_dict
	msg_dict['/arr_num']['param'] = 'num'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/monitor_info'
	msg_dict['/monitor_info'] = sec_dict
	msg_dict['/monitor_info']['param'] = 'err_dist'

	hz_checker.set_msg_t0(curr, topic = '/imu/data')
	hz_checker.set_msg_t0(curr, topic = '/gps')
	hz_checker.set_msg_t0(curr, topic = '/Flir/image_raw')
	hz_checker.set_msg_t0(curr, topic = '/rslidar_points')
	hz_checker.set_msg_t0(curr, topic = '/arr_num')
	hz_checker.set_msg_t0(curr, topic = '/monitor_info')

	rospy.Subscriber('/imu/data', Imu, sensor_msgs_Imu_callback)
	rospy.Subscriber('/gps', NavSatFix, sensor_msgs_NavSatFix_callback)
	rospy.Subscriber('/Flir/image_raw', Image, sensor_msgs_Image_callback)
	rospy.Subscriber('/rslidar_points', PointCloud2, sensor_msgs_PointCloud2_callback)
	rospy.Subscriber('/arr_num', arr_test, gen_watcher_msgs_arr_test_callback)
	rospy.Subscriber('/monitor_info', info, gen_watcher_msgs_info_callback)

	rospy.Timer(rospy.Duration(1), timer_callback)

	rospy.spin()


if __name__ == '__main__':
	main()
