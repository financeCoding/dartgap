DartGap: A Dart wrapper for Cordova
===================================

DartGap allows you to use Dart to implement mobile applications using
Apache Cordova (formerly PhoneGap). 

Currently DartGap does not implement the full Cordova 1.8 API however the idea is to implement all of it. So if 
you find something missing then grab the keyboard and send us a pull request.

Getting started
---------------

To use DartGap grab the following code from GitHub

 * ```git clone https://github.com/Qalqo/dartgap```
 * ```git clone https://github.com/Qalqo/log4dart```
 * ```mv log4dart log```

Then import dartgap/Lib.dart into your Dart code and then start
interacting with Cordova via

```
dartgap.onDeviceReady((Device device) {
  device.notification.alert("hello from Dart");
});
```

Finally to get the code running on your device check these platform specific guides

* [iOS](doc/iOS.md)
* [Android](doc/Android.md) 

Cordova API status
------------------

* Accelerometer
* Camera
* Capture
* Compass
* Connection
* Contacts
* Device: **Fully implemented**
* Events
* File
* Geolocation
* Media
* Notification: Work started
* Screen: **Fully implemented** 
* Storage: 
  * WebSQL: **Fully implemented**
  * LocalStorage: Work started 

TODO
----
* Implement more of the Cordova API http://docs.phonegap.com/en/edge/index.html

