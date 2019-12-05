#!/usr/bin/env python

import rospy
#from sensor_msgs.msg import NavSatFix
from sensor_msgs.msg import Imu

def callback_listener(data):
    rospy.loginfo(data.linear_acceleration.x)

def listener():
    rospy.init_node('listener', anonymous=True)

    #rospy.Subscriber('/gps', NavSatFix, callback_listener)
    rospy.Subscriber('/imu/data', Imu, callback_listener)
    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass