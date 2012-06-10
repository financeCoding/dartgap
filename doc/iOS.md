DartGap: A Dart wrapper for Cordova
===================================

DartGap allows you to use Dart to implement mobile applications using
Apache Cordova (formerly PhoneGap). 

Currently DartGap its more a proof of concept rather than a production ready wrapper of the full Cordova 1.6 API but
the idea is to implement all of it. So if you find something missing then grab the keyboard and send us a pull request.

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

Also checkout the iOS example below

Getting started on iOS
----------------------

1. Install the latest Cordova and create a sample application by following [this guide][ios]
1. Copy the **test/iOS/index.html** file from **DartGap** into your projects **www** folder.
1. Compile **test/CordovaApp.dart** with **frogc** and copy **CordovaApp.dart.js** to the projects **www** folder
1. Copy **DartGap.js** to your projects **www** folder.
1. Launch iOS Simulator from XCode.

If you change the Dart code in the application remember to recompile and copy it to the **www** folder again. 
Then restart the iOS simulator.

Cordova API status
------------------

* Accelerometer
* Camera
* Capture
* Compass
* Connection
* Contacts
* Device: Fully implemented
* Events
* File
* Geolocation
* Media
* Notification: Work started
* Storage: 
  * WebSQL: Fully implemented
  * LocalStorage: Work started 


TODO
----
* Implement more of the Cordova API http://docs.phonegap.com/en/edge/index.html
* publish API documentation on GitHub

[ios]: http://wiki.phonegap.com/w/page/52010495/Getting%20Started%20with%20PhoneGap-Cordova%20and%20Xcode%204

Eclipse Setup
-------------

1. Install Eclipse Classic from: http://www.eclipse.org/downloads
1. In Eclipse install Android tools from https://dl-ssl.google.com/android/eclipse
1. Restart Eclipse and choose to download the latest Android SDK (dialog
   after restart).

Android and Cordova Setup
-------------------------

1. Assert that the following enviroment variables exists
 * ANDROID_HOME (fx: ANDROID_HOME=/Applications/android-sdk/tools)
 * ANT_HOME (fx: ANT_HOME=/usr/share/ant)
 * JAVA_HOME (fx: JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home)
1. Add the Android SDK tool and platform tool folders to your path 
 * Example Mac: export PATH=/Applications/android-sdk/tools:/Applications/android-sdk/platform-tools:$PATH)
1. Assert that the following commands works 
 * java
 * javac
 * ant --execdebug
 * npm (from NodeJS)
 * android
 * adb 
1. Run the Android SDK Manager (android) and install ARM and Intel ABIs
1. Clone Cordova from https://github.com/apache/incubator-cordova-android into folder **cordova**
1. Download http://mirrors.dotsrc.org/apache//commons/codec/binaries/commons-codec-1.6-bin.zip
1. Unzip commons-codec-1.6-bin.zip and install it
 * unzip commons-codec-1.6-bin.zip
 * mkdir cordova/framework/libs
 * cp -a commons-codec-1.6/commons-codec-1.6.jar cordova/framework/libs
1. Build the cordova.jar
 * cd cordova/framework
 * android update project -p . -t android-15
 * ant jar
1. Enable cordova tools
 * cd cordova/bin
 * npm install
1. Test the example project
 * ./bin/emulate
 * ./bin/create
 * cd example
 * ./cordova/debug 
1. Create your own app
 * ./bin/create folder/to/create/app/in com.mycompany.app MyApp
 * cd folder/to/create/app/in
 * ./cordova/emulate
 * ./cordova/debug
 
Usefull Commands
----------------
* android list targets
* android list avd 
* android create avd -n default -t 1 --abi x86
* emulator @default
