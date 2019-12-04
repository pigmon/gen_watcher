#!/usr/bin/env python
# -*- coding:utf-8 -*-

# 注意：这是自动生成的程序，请不要做任何修改！

import rospy
import time
from std_msgs.msg import Header
from rostopic import ROSTopicHz
from rospy_test.msg import node_state
from rospy_test.msg import all_state
from rospy_test.msg import Num
from rospy_test.msg import info

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

	ret = hz_checker.get_hz('my_num')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['my_num']['hz'] = ret[0]
	else:
		msg_dict['my_num']['hz'] = -1
	msg_dict['my_num']['hz_state'] = func_checking_value(msg_dict['my_num']['hz'], 8, 12)

	node_msg.append(node_state('my_num', msg_dict['my_num']['hz'], msg_dict['my_num']['hz_state'], 'num', msg_dict['my_num']['param_value'], msg_dict['my_num']['param_state']))

	ret = hz_checker.get_hz('my_info')
	if isinstance(ret, tuple) and len(ret) == 5:
		msg_dict['my_info']['hz'] = ret[0]
	else:
		msg_dict['my_info']['hz'] = -1
	msg_dict['my_info']['hz_state'] = func_checking_value(msg_dict['my_info']['hz'], 8, 12)

	node_msg.append(node_state('my_info', msg_dict['my_info']['hz'], msg_dict['my_info']['hz_state'], 'fnum', msg_dict['my_info']['param_value'], msg_dict['my_info']['param_state']))

	header = Header(stamp=rospy.Time.now())
	big_msg = all_state(header, node_msg)
	pub.publish(big_msg)

def rospy_test_Num_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, 'my_num')
	msg_dict['my_num']['param_value'] = msg.num
	msg_dict['my_num']['param_state'] = func_checking_value(msg.num, 1, 2000000000)

def rospy_test_info_callback(msg):
	global hz_checker
	hz_checker.callback_hz(msg, 'my_info')
	msg_dict['my_info']['param_value'] = msg.fnum
	msg_dict['my_info']['param_state'] = func_checking_value(msg.fnum, 1, 10)

def main():
	rospy.init_node('listener', anonymous=False)
	curr = rospy.get_rostime().to_sec()

	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = 'my_num'
	msg_dict['my_num'] = sec_dict
	msg_dict['my_num']['param'] = 'num'
	sec_dict = dict.fromkeys(msg_keys)
	sec_dict['msg'] = 'my_info'
	msg_dict['my_info'] = sec_dict
	msg_dict['my_info']['param'] = 'fnum'

	hz_checker.set_msg_t0(curr, topic = 'my_num')
	hz_checker.set_msg_t0(curr, topic = 'my_info')

	rospy.Subscriber('my_num', Num, rospy_test_Num_callback)
	rospy.Subscriber('my_info', info, rospy_test_info_callback)

	rospy.Timer(rospy.Duration(1), timer_callback)

	rospy.spin()


if __name__ == '__main__':
	main()
