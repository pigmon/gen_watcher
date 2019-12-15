#!/usr/bin/env python

import rospy
from gen_watcher_msgs.msg import Num
#from sensor_msgs.msg import info
from std_msgs.msg import Header
from gen_watcher_msgs.msg import arr_test

def talker():
    #pub = rospy.Publisher('my_num', Num, queue_size = 10)
    #pub1 = rospy.Publisher('my_info', info, queue_size = 10)
    pub2 = rospy.Publisher('arr_num', arr_test, queue_size = 10)

    rospy.init_node('talker', anonymous = True)
    rate = rospy.Rate(10) # 10hz

    while not rospy.is_shutdown():
        #pub_num = int(rospy.get_time())
        #pub.publish(pub_num)

        #pub_info = float(rospy.get_time())
        #pub1.publish(pub_info)

        # array test
        num_list = []
        header = Header(stamp=rospy.Time.now())
        for i in range(1, 10):
            num_list.append(Num(i))
        test_msg = arr_test(header, num_list)
        pub2.publish(test_msg)

        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass