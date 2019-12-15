#!/usr/bin/env python

import rospy
#from sensor_msgs.msg import NavSatFix
#from sensor_msgs.msg import Imu
from gen_watcher_msgs.msg import Num
from gen_watcher_msgs.msg import arr_test

def callback_listener(msg):
    #rospy.loginfo(msg.linear_acceleration.x)
    for i in range(len(msg.numbers)):
        rospy.loginfo(msg.numbers[i].num)

def listener():
    rospy.init_node('listener', anonymous=True)

    #rospy.Subscriber('/gps', NavSatFix, callback_listener)
    rospy.Subscriber('/arr_num', arr_test, callback_listener)
    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass