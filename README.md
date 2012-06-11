DartGap: A Dart wrapper for Cordova
===================================

DartGap allows you to use Dart to implement mobile applications using
Apache Cordova (formerly PhoneGap). 

Currently DartGap does not implement the full Cordova 1.8 API however the idea is to implement all of it. So if 
you find something missing then grab the keyboard and send us a pull request.

Getting started
---------------

Create a Dart project and add a **pubspec.yaml** file to it 

``` 
dependencies:
  dartgap:
    git: git://github.com/Qalqo/dartgap.git
```

and run **pub install** to install **dartgap** (including its
dependencies). Now add import 

``` 
#import("package:dartgap/lib.dart") 
```

to your Dart code and then start interacting with Cordova via

```
dartgap.onDeviceReady((Device device) {
  device.notification.alert("hello from Dart");
});
```

Finally to get the code running on your device check these platform specific guides

* [iOS][ios]
* [Android][android] 

Cordova API status
------------------

* Accelerometer: **Partly implemented**
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
* Notification: **Fully implemented**
* Screen: **Fully implemented** 
* Storage: 
  * WebSQL: **Fully implemented**
  * LocalStorage: Work started 

TODO
----
* Implement more of the Cordova API http://docs.phonegap.com/en/edge/index.html

[android]: https://github.com/Qalqo/dartgap/blob/master/doc/Android.md
[ios]: https://github.com/Qalqo/dartgap/blob/master/doc/iOS.md
