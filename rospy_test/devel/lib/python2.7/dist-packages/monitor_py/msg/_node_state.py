# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from monitor_py/node_state.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class node_state(genpy.Message):
  _md5sum = "d06aaa16cbeab11b30b8b7466c37381a"
  _type = "monitor_py/node_state"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# 一个监视消息的数据
string msg_name
float64 hz
float64 hz_min
float64 hz_max
string param_name
float64 param_value
float64 param_min
float64 param_max"""
  __slots__ = ['msg_name','hz','hz_min','hz_max','param_name','param_value','param_min','param_max']
  _slot_types = ['string','float64','float64','float64','string','float64','float64','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       msg_name,hz,hz_min,hz_max,param_name,param_value,param_min,param_max

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(node_state, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.msg_name is None:
        self.msg_name = ''
      if self.hz is None:
        self.hz = 0.
      if self.hz_min is None:
        self.hz_min = 0.
      if self.hz_max is None:
        self.hz_max = 0.
      if self.param_name is None:
        self.param_name = ''
      if self.param_value is None:
        self.param_value = 0.
      if self.param_min is None:
        self.param_min = 0.
      if self.param_max is None:
        self.param_max = 0.
    else:
      self.msg_name = ''
      self.hz = 0.
      self.hz_min = 0.
      self.hz_max = 0.
      self.param_name = ''
      self.param_value = 0.
      self.param_min = 0.
      self.param_max = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.msg_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3d().pack(_x.hz, _x.hz_min, _x.hz_max))
      _x = self.param_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3d().pack(_x.param_value, _x.param_min, _x.param_max))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.msg_name = str[start:end].decode('utf-8')
      else:
        self.msg_name = str[start:end]
      _x = self
      start = end
      end += 24
      (_x.hz, _x.hz_min, _x.hz_max,) = _get_struct_3d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.param_name = str[start:end].decode('utf-8')
      else:
        self.param_name = str[start:end]
      _x = self
      start = end
      end += 24
      (_x.param_value, _x.param_min, _x.param_max,) = _get_struct_3d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.msg_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3d().pack(_x.hz, _x.hz_min, _x.hz_max))
      _x = self.param_name
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3d().pack(_x.param_value, _x.param_min, _x.param_max))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.msg_name = str[start:end].decode('utf-8')
      else:
        self.msg_name = str[start:end]
      _x = self
      start = end
      end += 24
      (_x.hz, _x.hz_min, _x.hz_max,) = _get_struct_3d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.param_name = str[start:end].decode('utf-8')
      else:
        self.param_name = str[start:end]
      _x = self
      start = end
      end += 24
      (_x.param_value, _x.param_min, _x.param_max,) = _get_struct_3d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
