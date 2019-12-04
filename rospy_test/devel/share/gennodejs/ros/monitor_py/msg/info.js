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

class info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fnum = null;
    }
    else {
      if (initObj.hasOwnProperty('fnum')) {
        this.fnum = initObj.fnum
      }
      else {
        this.fnum = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type info
    // Serialize message field [fnum]
    bufferOffset = _serializer.float64(obj.fnum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type info
    let len;
    let data = new info(null);
    // Deserialize message field [fnum]
    data.fnum = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'monitor_py/info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cce30792a39fb76bc5361a9e6d6ed985';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 fnum
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new info(null);
    if (msg.fnum !== undefined) {
      resolved.fnum = msg.fnum;
    }
    else {
      resolved.fnum = 0.0
    }

    return resolved;
    }
};

module.exports = info;
