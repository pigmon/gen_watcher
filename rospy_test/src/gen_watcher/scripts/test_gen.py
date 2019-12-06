#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os
import ConfigParser
import io

## Reading INI
big_dict = []
dict_keys = ['package', 'msg', 'msg_nake_name', 'check_param', 'min', 'max', 'hz_min', 'hz_max']

# Load the configuration file
with open("../config/watch.ini") as f:
    sample_config = f.read()

config = ConfigParser.RawConfigParser(allow_no_value=True)
config.readfp(io.BytesIO(sample_config))

for section in config.sections():
    dict_sec = dict.fromkeys(dict_keys, '')

    dict_sec['package'] = config.get(section, 'PACKAGE')
    dict_sec['msg'] = config.get(section, 'MSG')
    dict_sec['msg_nake_name'] = config.get(section, 'MSG_NAKE_NAME')
    dict_sec['check_param'] = config.get(section, 'CHECKING_PARAM')
    str_param_checking = config.get(section, 'CHECKING_VALUE')
    array_split = str_param_checking.split(',')
    dict_sec['min'] = array_split[1]
    dict_sec['max'] = array_split[2]
    str_param_checking_hz = config.get(section, 'HZ_RANGE')
    array_split_hz = str_param_checking_hz.split(',')
    dict_sec['hz_min'] = array_split_hz[0]
    dict_sec['hz_max'] = array_split_hz[1]

    big_dict.append(dict_sec)

#print(big_dict)


## Data Trans
array_import = []
array_check_func = []
array_sub = []
array_t0 = []
array_timer_callback = []
array_msg_dict = []

big_dict_len = len(big_dict)

for i in range(big_dict_len):
    dict = big_dict[i]

    package_name = dict['package']
    msg_name = dict['msg']
    msg_nake_name = dict['msg_nake_name']
    check_param_name = dict['check_param']
    check_param_min = dict['min']
    check_param_max = dict['max']
    hz_min = dict['hz_min']
    hz_max = dict['hz_max']

    # 1. import part
    import_line = "from %s.msg import %s\n" % (package_name, msg_name)
    array_import.append(import_line)
    # 2. generate checking function
    callback_name = package_name + '_' + msg_name + '_callback'
    callback_body_0 = "\tglobal hz_checker\n"
    callback_body_1 = "\thz_checker.callback_hz(msg, \'%s\')\n" % msg_nake_name
    callback_body_2 = "\tmsg_dict['%s']['param_value'] = msg.%s\n" % (msg_nake_name, check_param_name)
    tuple_check_func = ('def ' + callback_name + "(msg):\n", callback_body_0, callback_body_1, callback_body_2)
    array_check_func.append(tuple_check_func)

    # 3. timer_callback
    timer_body_0 = "\tret = hz_checker.get_hz(\'%s\')\n" % msg_nake_name
    timer_body_1 = "\tif isinstance(ret, tuple) and len(ret) == 5:\n"
    timer_body_2 = "\t\tmsg_dict['%s']['hz'] = ret[0]\n" % msg_nake_name
    timer_body_3 = "\telse:\n"
    timer_body_4 = "\t\tmsg_dict['%s']['hz'] = -1\n\n" % msg_nake_name
    timer_body_5 = "\tif msg_dict['%s']['hz'] <= 0:\n\t\tmsg_dict['%s']['param_value'] = -1024\n\n" % (msg_nake_name, msg_nake_name)
    timer_body_6 = "\tnode_msg.append(node_state('%s', msg_dict['%s']['hz'], %s, %s, '%s', msg_dict['%s']['param_value'], %s, %s))\n\n" %  \
        (msg_nake_name, msg_nake_name, hz_min, hz_max, check_param_name, msg_nake_name, check_param_min, check_param_max)

    tupple_timer = (timer_body_0, timer_body_1, timer_body_2, timer_body_3, timer_body_4, timer_body_5, timer_body_6)
    array_timer_callback.append(tupple_timer)

    # 4. main function
    gen_sub = "\trospy.Subscriber('%s', %s, %s)\n" % (msg_nake_name, msg_name, callback_name)
    array_sub.append(gen_sub)
    # 5. set msg 0 time
    gen_t0 = "\thz_checker.set_msg_t0(curr, topic = \'%s\')\n" % msg_nake_name
    array_t0.append(gen_t0)

    # 6. Making message dictionary
    gen_dict_0 = "\tsec_dict = dict.fromkeys(msg_keys)\n"
    gen_dict_1 = "\tsec_dict['msg'] = '%s'\n" % msg_nake_name
    gen_dict_2 = "\tmsg_dict['%s'] = sec_dict\n" % msg_nake_name
    gen_dict_3 = "\tmsg_dict['%s']['param'] = '%s'\n" % (msg_nake_name, check_param_name)
    tupple_msg_dict = (gen_dict_0, gen_dict_1, gen_dict_2, gen_dict_3)
    array_msg_dict.append(tupple_msg_dict)


## Code Generating
gen_py = open('gen.py', 'w+')

_STATIC_PY_HEADER_ = ("#!/usr/bin/env python\n# -*- coding:utf-8 -*-\n\n", "# 注意：这是自动生成的程序，请不要做任何修改！\n\n", "import rospy\n", "import time\n", "from std_msgs.msg import Header\n", "from rostopic import ROSTopicHz\n", "from gen_watcher_msgs.msg import node_state\n", "from gen_watcher_msgs.msg import all_state\n")
_STATIC_FUNC_CHECK_ = ("def func_checking_value(param, min, max):\n", "\treturn param <= max and param >= min\n")
_TIMER_CALLBACK_HEADER = ("def timer_callback(event):\n", "\tglobal hz_checker\n", "\tglobal pub\n\n", "\tnode_msg = []\n\n")
_MAIN_FUNC_ = ("def main():\n", "\trospy.init_node('listener', anonymous=False)\n", "\tcurr = rospy.get_rostime().to_sec()\n\n")
_MAIN_FUNC_TAIL_ = ("\n\trospy.Timer(rospy.Duration(1), timer_callback)\n\n", "\trospy.spin()\n\n")
_MAIN_PART_ = ("if __name__ == '__main__':\n", "\tmain()\n")
_TIMER_TAIL_ = ("\theader = Header(stamp=rospy.Time.now())\n", "\tbig_msg = all_state(header, node_msg)\n", "\tpub.publish(big_msg)\n\n")

gen_py.writelines(_STATIC_PY_HEADER_)
gen_py.writelines(array_import)
gen_py.write("\nhz_checker = ROSTopicHz(10, use_wtime=True)\n\n")
gen_py.writelines(("msg_dict = {}\n", "msg_keys = ['msg', 'hz', 'hz_min', 'hz_max', 'param', 'param_value', 'param_min', 'param_max']\n"))
gen_py.write("pub = rospy.Publisher('node_states', all_state, queue_size = 10)\n")
gen_py.write("\n")

gen_py.writelines(_STATIC_FUNC_CHECK_)
gen_py.write("\n")

gen_py.writelines(_TIMER_CALLBACK_HEADER)
for idx_timer in range(len(array_timer_callback)):
    _tuple = array_timer_callback[idx_timer]
    gen_py.writelines(_tuple)
#gen_py.write("\trospy.loginfo(node_msg)\n\n")
gen_py.writelines(_TIMER_TAIL_)

for idx_check in range(len(array_check_func)):
    tuple_check = array_check_func[idx_check]
    gen_py.writelines(tuple_check)
    gen_py.write("\n")

gen_py.writelines(_MAIN_FUNC_)

for idx_msg_dict in range(len(array_msg_dict)):
    _tuple = array_msg_dict[idx_msg_dict]
    gen_py.writelines(_tuple)

gen_py.write('\n')
gen_py.writelines(array_t0)
gen_py.write('\n')
gen_py.writelines(array_sub)
gen_py.writelines(_MAIN_FUNC_TAIL_)
gen_py.write("\n")
gen_py.writelines(_MAIN_PART_)

gen_py.close()

