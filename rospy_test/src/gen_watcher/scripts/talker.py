#!/usr/bin/env python

import rospy
from monitor_py.msg import Num
from monitor_py.msg import info

def talker():
    pub = rospy.Publisher('my_num', Num, queue_size = 10)
    pub1 = rospy.Publisher('my_info', info, queue_size = 10)

    rospy.init_node('talker', anonymous = True)
    rate = rospy.Rate(10) # 10hz

    while not rospy.is_shutdown():
        pub_num = int(rospy.get_time())
        pub.publish(pub_num)

        pub_info = float(rospy.get_time())
        pub1.publish(pub_info)

        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass