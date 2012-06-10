// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _DeviceScreenImpl implements DeviceScreen {
  factory _DeviceScreenImpl(Map data) {
    return new _DeviceScreenImpl._internal(data["colorDepth"], data["height"], data["width"]);
  }
  
  _DeviceScreenImpl._internal(this.colorDepth, this.height, this.width);
  
  final String colorDepth;
  final String height;
  final String width;
}
