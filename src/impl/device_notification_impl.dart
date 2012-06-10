// Copyright (c) 2012 Qalqo, all rights reserved.  
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _DeviceNotificationImpl extends _DeviceAware implements DeviceNotification {
  _DeviceNotificationImpl(): super("notification");
  
  Future<Map> alert(String alertMessage) {
    var completer = new Completer<Map>();
    
    var message = createMessage("alert");
    message.content["alert"] = alertMessage;
    message.callback = (_DeviceMessage msg) {
      completer.complete(msg.content);
    };
    sendMessage(message);
    
    return completer.future;
  }
  
  beep(int times) {
    var message = createMessage("beep");
    message.content["times"] = times;
    sendMessage(message);
  }
  
  Future<int> confirm(String dialog, [String title = "Confirm", String labels = "OK,Cancel"]) {
    var completer = new Completer<Map>();
    
    var message = createMessage("confirm");
    message.content["dialog"] = dialog;
    message.content["title"] = title;
    message.content["labels"] = labels;
    message.callback = (_DeviceMessage msg) {
      var btnIndex = msg.content;
      completer.complete(btnIndex);
    };
    sendMessage(message);
    
    return completer.future;
  }
  
  vibrate(int duration) {
    var message = createMessage("vibrate");
    message.content["duration"] = duration;
    sendMessage(message);
  }
}