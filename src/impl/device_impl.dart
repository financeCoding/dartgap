// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _DeviceImpl extends _DeviceAware implements Device {
  _DeviceImpl()
    : notification = new _DeviceNotificationImpl(), 
      super("device");
  
  Future<DeviceInfo> get info() {
    var completer = new Completer<DeviceInfo>();
    
    var message = createMessage("info");
    message.callback = (_DeviceMessage msg) {
      var info = new _DeviceInfoImpl(msg.content);
      completer.complete(info);
    };
    sendMessage(message);
    
    return completer.future;
  }
  
  Future<DeviceDatabase> openDatabase(String name, String version, String displayName, int size) {
    var completer = new Completer<DeviceInfo>();
    var connectionId = new _Guid();
    
    var message = createMessage("openDatabase");
    message.content["connectionId"] = connectionId.toString();
    message.content["name"] = name;
    message.content["version"] = version;
    message.content["displayName"] = displayName;
    message.content["size"] = size;
    message.callback = (_DeviceMessage msg) {
      if(msg.hasErrors) {
        completer.completeException("failed to open database $name");
      } else {
        var db = new _DeviceDatabaseImpl(connectionId);
        completer.complete(db);
      }
    };
    sendMessage(message);
    
    return completer.future;
  }
  
  final DeviceNotification notification;
}

