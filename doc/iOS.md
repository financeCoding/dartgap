DartGap on iOS
==============

XCode Setup
-----------
1. Install the latest Cordova version from http://phonegap.com/download.

XCode Cordova Setup
-------------------
A detailed description on how to create a Cordova with XCode can be
found [here][ios]. A short version is given below

1. Start XCode and choose "File -> New -> Project", then select "Cordova-based Application" 
1. Give your app a name and uncheck "Use Automatic Reference Counting"
1. In finder navigate to the folder you created the project in and drag
   the **www** folder into the XCode project window.

Create iOS Dart App
-------------------

1. Copy the **templates/iOS/index.html** file from **DartGap** into your projects **www** folder.
1. Compile **templates/CordovaApp.dart** with **dart2js** and copy **CordovaApp.dart.js** to the projects **www** folder
1. Copy **DartGap.js** to your projects **www** folder.
1. Launch iOS Simulator from XCode.

If you change the Dart code in the application remember to recompile and copy it to the **www** folder again. 
Then restart the iOS simulator.

[ios]: http://wiki.phonegap.com/w/page/52010495/Getting%20Started%20with%20PhoneGap-Cordova%20and%20Xcode%204
