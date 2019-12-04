// Auto-generated. Do not edit!

// (in-package monitor_py.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class node_state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.msg_name = null;
      this.hz = null;
      this.hz_min = null;
      this.hz_max = null;
      this.param_name = null;
      this.param_value = null;
      this.param_min = null;
      this.param_max = null;
    }
    else {
      if (initObj.hasOwnProperty('msg_name')) {
        this.msg_name = initObj.msg_name
      }
      else {
        this.msg_name = '';
      }
      if (initObj.hasOwnProperty('hz')) {
        this.hz = initObj.hz
      }
      else {
        this.hz = 0.0;
      }
      if (initObj.hasOwnProperty('hz_min')) {
        this.hz_min = initObj.hz_min
      }
      else {
        this.hz_min = 0.0;
      }
      if (initObj.hasOwnProperty('hz_max')) {
        this.hz_max = initObj.hz_max
      }
      else {
        this.hz_max = 0.0;
      }
      if (initObj.hasOwnProperty('param_name')) {
        this.param_name = initObj.param_name
      }
      else {
        this.param_name = '';
      }
      if (initObj.hasOwnProperty('param_value')) {
        this.param_value = initObj.param_value
      }
      else {
        this.param_value = 0.0;
      }
      if (initObj.hasOwnProperty('param_min')) {
        this.param_min = initObj.param_min
      }
      else {
        this.param_min = 0.0;
      }
      if (initObj.hasOwnProperty('param_max')) {
        this.param_max = initObj.param_max
      }
      else {
        this.param_max = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type node_state
    // Serialize message field [msg_name]
    bufferOffset = _serializer.string(obj.msg_name, buffer, bufferOffset);
    // Serialize message field [hz]
    bufferOffset = _serializer.float64(obj.hz, buffer, bufferOffset);
    // Serialize message field [hz_min]
    bufferOffset = _serializer.float64(obj.hz_min, buffer, bufferOffset);
    // Serialize message field [hz_max]
    bufferOffset = _serializer.float64(obj.hz_max, buffer, bufferOffset);
    // Serialize message field [param_name]
    bufferOffset = _serializer.string(obj.param_name, buffer, bufferOffset);
    // Serialize message field [param_value]
    bufferOffset = _serializer.float64(obj.param_value, buffer, bufferOffset);
    // Serialize message field [param_min]
    bufferOffset = _serializer.float64(obj.param_min, buffer, bufferOffset);
    // Serialize message field [param_max]
    bufferOffset = _serializer.float64(obj.param_max, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type node_state
    let len;
    let data = new node_state(null);
    // Deserialize message field [msg_name]
    data.msg_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [hz]
    data.hz = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [hz_min]
    data.hz_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [hz_max]
    data.hz_max = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [param_name]
    data.param_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [param_value]
    data.param_value = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [param_min]
    data.param_min = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [param_max]
    data.param_max = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.msg_name.length;
    length += object.param_name.length;
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'monitor_py/node_state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd06aaa16cbeab11b30b8b7466c37381a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 一个监视消息的数据
    string msg_name
    float64 hz
    float64 hz_min
    float64 hz_max
    string param_name
    float64 param_value
    float64 param_min
    float64 param_max
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new node_state(null);
    if (msg.msg_name !== undefined) {
      resolved.msg_name = msg.msg_name;
    }
    else {
      resolved.msg_name = ''
    }

    if (msg.hz !== undefined) {
      resolved.hz = msg.hz;
    }
    else {
      resolved.hz = 0.0
    }

    if (msg.hz_min !== undefined) {
      resolved.hz_min = msg.hz_min;
    }
    else {
      resolved.hz_min = 0.0
    }

    if (msg.hz_max !== undefined) {
      resolved.hz_max = msg.hz_max;
    }
    else {
      resolved.hz_max = 0.0
    }

    if (msg.param_name !== undefined) {
      resolved.param_name = msg.param_name;
    }
    else {
      resolved.param_name = ''
    }

    if (msg.param_value !== undefined) {
      resolved.param_value = msg.param_value;
    }
    else {
      resolved.param_value = 0.0
    }

    if (msg.param_min !== undefined) {
      resolved.param_min = msg.param_min;
    }
    else {
      resolved.param_min = 0.0
    }

    if (msg.param_max !== undefined) {
      resolved.param_max = msg.param_max;
    }
    else {
      resolved.param_max = 0.0
    }

    return resolved;
    }
};

module.exports = node_state;
