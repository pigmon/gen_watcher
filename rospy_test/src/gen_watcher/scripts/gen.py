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
from traffic_light.msg import msg_traffic_light_list
from gen_watcher_msgs.msg import info
from cam.msg import DetectedObjectArray

hz_checker = ROSTopicHz(10, use_wtime=True)

msg_dict = {}
msg_keys = ['key', 'msg', 'hz', 'hz_min', 'hz_max', 'param', 'param_value', 'param_min', 'param_max', 'extra']
pub = rospy.Publisher('node_states', all_state, queue_size = 10)

def func_checking_value(param, min, max):
	return param <= max and param >= min

def timer_callback(event):
	global hz_checker
	global pub

	node_msg = []

	ret = hz_checker.get_hz('/imu/data')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['imu']['hz'] = ret[0]
	else:
		msg_dict['imu']['hz'] = -1

	if msg_dict['imu']['hz'] <= 0:
		msg_dict['imu']['param_value'] = -1024

	node_msg.append(node_state('imu', '/imu/data', msg_dict['imu']['hz'], 30, 1000, 'linear_acceleration.x', msg_dict['imu']['param_value'], 0.03, 10, msg_dict['imu']['extra']))

	ret = hz_checker.get_hz('/gps')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['gps']['hz'] = ret[0]
	else:
		msg_dict['gps']['hz'] = -1

	if msg_dict['gps']['hz'] <= 0:
		msg_dict['gps']['param_value'] = -1024

	node_msg.append(node_state('gps', '/gps', msg_dict['gps']['hz'], 30, 1000, 'longitude', msg_dict['gps']['param_value'], -180, 180, msg_dict['gps']['extra']))

	ret = hz_checker.get_hz('/Flir/image_raw')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['cam']['hz'] = ret[0]
	else:
		msg_dict['cam']['hz'] = -1

	if msg_dict['cam']['hz'] <= 0:
		msg_dict['cam']['param_value'] = -1024

	node_msg.append(node_state('cam', '/Flir/image_raw', msg_dict['cam']['hz'], 58, 1000, 'width', msg_dict['cam']['param_value'], 1200, 2048, msg_dict['cam']['extra']))

	ret = hz_checker.get_hz('/rslidar_points')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['lidar']['hz'] = ret[0]
	else:
		msg_dict['lidar']['hz'] = -1

	if msg_dict['lidar']['hz'] <= 0:
		msg_dict['lidar']['param_value'] = -1024

	node_msg.append(node_state('lidar', '/rslidar_points', msg_dict['lidar']['hz'], 9, 1000, 'data', msg_dict['lidar']['param_value'], 2000000, 3000000, msg_dict['lidar']['extra']))

	ret = hz_checker.get_hz('/traffic_light_state')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['traffic_light']['hz'] = ret[0]
	else:
		msg_dict['traffic_light']['hz'] = -1

	if msg_dict['traffic_light']['hz'] <= 0:
		msg_dict['traffic_light']['param_value'] = -1024

	node_msg.append(node_state('traffic_light', '/traffic_light_state', msg_dict['traffic_light']['hz'], 30, 1000, 'color', msg_dict['traffic_light']['param_value'], 1, 2, msg_dict['traffic_light']['extra']))

	ret = hz_checker.get_hz('/monitor_info')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['path_error']['hz'] = ret[0]
	else:
		msg_dict['path_error']['hz'] = -1

	if msg_dict['path_error']['hz'] <= 0:
		msg_dict['path_error']['param_value'] = -1024

	node_msg.append(node_state('path_error', '/monitor_info', msg_dict['path_error']['hz'], 0, 1000, 'err_dist', msg_dict['path_error']['param_value'], 0, 2, msg_dict['path_error']['extra']))

	ret = hz_checker.get_hz('/camera_detect_msg')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['blind_zone']['hz'] = ret[0]
	else:
		msg_dict['blind_zone']['hz'] = -1

	if msg_dict['blind_zone']['hz'] <= 0:
		msg_dict['blind_zone']['param_value'] = -1024

	node_msg.append(node_state('blind_zone', '/camera_detect_msg', msg_dict['blind_zone']['hz'], 1, 1000, 'objects', msg_dict['blind_zone']['param_value'], -0.1, 0.1, msg_dict['blind_zone']['extra']))

	header = Header(stamp=rospy.Time.now())
	big_msg = all_state(header, node_msg)
	pub.publish(big_msg)

def sensor_msgs_Imu_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/imu/data')
	msg_dict['imu']['param_value'] = msg.linear_acceleration.x

def sensor_msgs_NavSatFix_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/gps')
	msg_dict['gps']['param_value'] = msg.longitude

def sensor_msgs_Image_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/Flir/image_raw')
	msg_dict['cam']['param_value'] = msg.width

def sensor_msgs_PointCloud2_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/rslidar_points')
	msg_dict['lidar']['param_value'] = len(msg.data)

def traffic_light_msg_traffic_light_list_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/traffic_light_state')
	msg_dict['traffic_light']['extra'] = []
	for i in range(len(msg.lights)):
		msg_dict['traffic_light']['extra'].append(msg.lights[i].color)

def gen_watcher_msgs_info_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/monitor_info')
	msg_dict['path_error']['param_value'] = msg.err_dist

def cam_DetectedObjectArray_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/camera_detect_msg')
	msg_dict['blind_zone']['param_value'] = len(msg.objects)

def main():
	rospy.init_node('listener', anonymous=False)
	curr = rospy.get_rostime().to_sec()

	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/imu/data'
	msg_dict['imu'] = sec_dict
	msg_dict['imu']['param'] = 'linear_acceleration.x'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/gps'
	msg_dict['gps'] = sec_dict
	msg_dict['gps']['param'] = 'longitude'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/Flir/image_raw'
	msg_dict['cam'] = sec_dict
	msg_dict['cam']['param'] = 'width'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/rslidar_points'
	msg_dict['lidar'] = sec_dict
	msg_dict['lidar']['param'] = 'data'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/traffic_light_state'
	msg_dict['traffic_light'] = sec_dict
	msg_dict['traffic_light']['param'] = 'color'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/monitor_info'
	msg_dict['path_error'] = sec_dict
	msg_dict['path_error']['param'] = 'err_dist'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = '/camera_detect_msg'
	msg_dict['blind_zone'] = sec_dict
	msg_dict['blind_zone']['param'] = 'objects'

	hz_checker.set_msg_t0(curr, topic = '/imu/data')
	hz_checker.set_msg_t0(curr, topic = '/gps')
	hz_checker.set_msg_t0(curr, topic = '/Flir/image_raw')
	hz_checker.set_msg_t0(curr, topic = '/rslidar_points')
	hz_checker.set_msg_t0(curr, topic = '/traffic_light_state')
	hz_checker.set_msg_t0(curr, topic = '/monitor_info')
	hz_checker.set_msg_t0(curr, topic = '/camera_detect_msg')

	rospy.Subscriber('/imu/data', Imu, sensor_msgs_Imu_callback)
	rospy.Subscriber('/gps', NavSatFix, sensor_msgs_NavSatFix_callback)
	rospy.Subscriber('/Flir/image_raw', Image, sensor_msgs_Image_callback)
	rospy.Subscriber('/rslidar_points', PointCloud2, sensor_msgs_PointCloud2_callback)
	rospy.Subscriber('/traffic_light_state', msg_traffic_light_list, traffic_light_msg_traffic_light_list_callback)
	rospy.Subscriber('/monitor_info', info, gen_watcher_msgs_info_callback)
	rospy.Subscriber('/camera_detect_msg', DetectedObjectArray, cam_DetectedObjectArray_callback)

	rospy.Timer(rospy.Duration(1), timer_callback)

	rospy.spin()


if __name__ == '__main__':
	main()
