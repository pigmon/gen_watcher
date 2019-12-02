#!/usr/bin/env python

import rospy
import time
from std_msgs.msg import Header
from rostopic import ROSTopicHz
from monitor_py.msg import node_state
from monitor_py.msg import all_state
from sensor_msgs.msg import Imu
from sensor_msgs.msg import NavSatFix

hz_checker = ROSTopicHz(10, use_wtime=True)

msg_dict = {}
msg_keys = ['msg', 'hz', 'hz_state', 'param', 'param_value', 'param_state']
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
	msg_dict['/imu/data']['hz_state'] = func_checking_value(msg_dict['/imu/data']['hz'], 30, 1000)

	node_msg.append(node_state('/imu/data', ret[0], msg_dict['/imu/data']['hz_state'], 'linear_acceleration.x', msg_dict['/imu/data']['param_value'], msg_dict['/imu/data']['param_state']))

	ret = hz_checker.get_hz('/gps')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['/gps']['hz'] = ret[0]
	else:
		msg_dict['/gps']['hz'] = -1
	msg_dict['/gps']['hz_state'] = func_checking_value(msg_dict['/gps']['hz'], 30, 1000)

	node_msg.append(node_state('/gps', ret[0], msg_dict['/gps']['hz_state'], 'longitude', msg_dict['/gps']['param_value'], msg_dict['/gps']['param_state']))

	header = Header(stamp=rospy.Time.now())
	big_msg = all_state(header, node_msg)
	pub.publish(big_msg)

def sensor_msgs_Imu_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/imu/data')
	msg_dict['/imu/data']['param_value'] = msg.linear_acceleration.x
	msg_dict['/imu/data']['param_state'] = func_checking_value(msg.linear_acceleration.x, 0.03, 10)

def sensor_msgs_NavSatFix_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, '/gps')
	msg_dict['/gps']['param_value'] = msg.longitude
	msg_dict['/gps']['param_state'] = func_checking_value(msg.longitude, -180, 180)

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

	hz_checker.set_msg_t0(curr, topic = '/imu/data')
	hz_checker.set_msg_t0(curr, topic = '/gps')

	rospy.Subscriber('/imu/data', Imu, sensor_msgs_Imu_callback)
	rospy.Subscriber('/gps', NavSatFix, sensor_msgs_NavSatFix_callback)

	rospy.Timer(rospy.Duration(1), timer_callback)

	rospy.spin()


if __name__ == '__main__':
	main()
