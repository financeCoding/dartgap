// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _DeviceAccelerometerImpl extends _DeviceAware implements DeviceAccelerometer {
  _DeviceAccelerometerImpl(): super("accelerometer");
  
  Future<Map> get currentAcceleration() {
    var completer = new Completer<Map>();
    
    var message = createMessage("current");
    message.callback = (_DeviceMessage msg) {
      completer.complete(msg.content);
    };
    sendMessage(message);
    
    return completer.future;
  }
}