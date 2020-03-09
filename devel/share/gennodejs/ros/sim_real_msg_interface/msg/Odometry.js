// Auto-generated. Do not edit!

// (in-package sim_real_msg_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Odometry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ap_time = null;
      this.wheel_R = null;
      this.wheel_L = null;
      this.gyro = null;
      this.acc1 = null;
      this.acc2 = null;
      this.magn = null;
      this.velocity = null;
      this.omega = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ap_time')) {
        this.ap_time = initObj.ap_time
      }
      else {
        this.ap_time = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_R')) {
        this.wheel_R = initObj.wheel_R
      }
      else {
        this.wheel_R = 0.0;
      }
      if (initObj.hasOwnProperty('wheel_L')) {
        this.wheel_L = initObj.wheel_L
      }
      else {
        this.wheel_L = 0.0;
      }
      if (initObj.hasOwnProperty('gyro')) {
        this.gyro = initObj.gyro
      }
      else {
        this.gyro = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('acc1')) {
        this.acc1 = initObj.acc1
      }
      else {
        this.acc1 = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('acc2')) {
        this.acc2 = initObj.acc2
      }
      else {
        this.acc2 = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('magn')) {
        this.magn = initObj.magn
      }
      else {
        this.magn = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('omega')) {
        this.omega = initObj.omega
      }
      else {
        this.omega = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Odometry
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ap_time]
    bufferOffset = _serializer.float32(obj.ap_time, buffer, bufferOffset);
    // Serialize message field [wheel_R]
    bufferOffset = _serializer.float32(obj.wheel_R, buffer, bufferOffset);
    // Serialize message field [wheel_L]
    bufferOffset = _serializer.float32(obj.wheel_L, buffer, bufferOffset);
    // Serialize message field [gyro]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.gyro, buffer, bufferOffset);
    // Serialize message field [acc1]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.acc1, buffer, bufferOffset);
    // Serialize message field [acc2]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.acc2, buffer, bufferOffset);
    // Serialize message field [magn]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.magn, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float32(obj.velocity, buffer, bufferOffset);
    // Serialize message field [omega]
    bufferOffset = _serializer.float32(obj.omega, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Odometry
    let len;
    let data = new Odometry(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ap_time]
    data.ap_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wheel_R]
    data.wheel_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wheel_L]
    data.wheel_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gyro]
    data.gyro = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [acc1]
    data.acc1 = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [acc2]
    data.acc2 = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [magn]
    data.magn = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [omega]
    data.omega = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 116;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sim_real_msg_interface/Odometry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '89f83a34da9c89a443ae852ee70fa087';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    float32 ap_time
    float32 wheel_R
    float32 wheel_L
    geometry_msgs/Vector3 gyro
    geometry_msgs/Vector3 acc1
    geometry_msgs/Vector3 acc2
    geometry_msgs/Vector3 magn
    float32 velocity
    float32 omega
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Odometry(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ap_time !== undefined) {
      resolved.ap_time = msg.ap_time;
    }
    else {
      resolved.ap_time = 0.0
    }

    if (msg.wheel_R !== undefined) {
      resolved.wheel_R = msg.wheel_R;
    }
    else {
      resolved.wheel_R = 0.0
    }

    if (msg.wheel_L !== undefined) {
      resolved.wheel_L = msg.wheel_L;
    }
    else {
      resolved.wheel_L = 0.0
    }

    if (msg.gyro !== undefined) {
      resolved.gyro = geometry_msgs.msg.Vector3.Resolve(msg.gyro)
    }
    else {
      resolved.gyro = new geometry_msgs.msg.Vector3()
    }

    if (msg.acc1 !== undefined) {
      resolved.acc1 = geometry_msgs.msg.Vector3.Resolve(msg.acc1)
    }
    else {
      resolved.acc1 = new geometry_msgs.msg.Vector3()
    }

    if (msg.acc2 !== undefined) {
      resolved.acc2 = geometry_msgs.msg.Vector3.Resolve(msg.acc2)
    }
    else {
      resolved.acc2 = new geometry_msgs.msg.Vector3()
    }

    if (msg.magn !== undefined) {
      resolved.magn = geometry_msgs.msg.Vector3.Resolve(msg.magn)
    }
    else {
      resolved.magn = new geometry_msgs.msg.Vector3()
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.omega !== undefined) {
      resolved.omega = msg.omega;
    }
    else {
      resolved.omega = 0.0
    }

    return resolved;
    }
};

module.exports = Odometry;
