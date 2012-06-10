DartGap: A Dart wrapper for Cordova
===================================

DartGap allows you to use Dart to implement mobile applications using
Apache Cordova (formerly PhoneGap). 

Currently DartGap its more a proof of concept rather than a production ready wrapper of the full Cordova 1.6 API but
the idea is to implement all of it. So if you find something missing then grab the keyboard and send us a pull request.

Getting started
---------------

Make sure you have downloaded and installed the latest release of
PhoneGap from http://phonegap.com/download. Next to use DartGap grab the
following code from GitHub

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

Also check the following device specific guides

* [iOS]
* [Android]

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
* Storage: 
  * WebSQL: **Fully implemented**
  * LocalStorage: Work started 


TODO
----
* Implement more of the Cordova API http://docs.phonegap.com/en/edge/index.html
* publish API documentation on GitHub

