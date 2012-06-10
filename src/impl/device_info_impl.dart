// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _DeviceInfoImpl implements DeviceInfo {
  factory _DeviceInfoImpl(Map data) {
    var screenInfo = new _DeviceScreenImpl(data["screen"]);
    var deviceInfo = new _DeviceInfoImpl._internal(
      data["name"], 
      data["cordovaVersion"], 
      data["platform"], 
      data["uuid"], 
      data["deviceVersion"], 
      screenInfo);
    return deviceInfo;
  }
  
  _DeviceInfoImpl._internal(this.name, this.cordovaVersion, this.platform, this.uuid, this.deviceVersion, this.screen);
  
  final String name;
  final String cordovaVersion;
  final String platform;
  final String uuid;
  final String deviceVersion;
  final DeviceScreen screen;
}
