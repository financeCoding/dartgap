DartGap on Android
==================

To use DartGap on Android go through the following steps

Install Eclipse
---------------

1. Install Eclipse Classic from: http://www.eclipse.org/downloads
1. In Eclipse install Android tools from https://dl-ssl.google.com/android/eclipse
1. Restart Eclipse and choose to download the latest Android SDK.

Android Cordova Setup
---------------------

1. Assert that the following enviroment variables exists
 * ```ANDROID_HOME``` (ex: ANDROID_HOME=/Applications/android-sdk/tools)
 * ```ANT_HOME``` (ex: ANT_HOME=/usr/share/ant)
 * ```JAVA_HOME``` (ex: JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home)
1. Add Android folders to your path 
 * ```export PATH=/Applications/android-sdk/tools:/Applications/android-sdk/platform-tools:$PATH```
1. Before continuing check that the following commands works: **java, javac, npm, android** and **adb** 
1. Run the Android SDK Manager by typing **android** in a prompt and install the **ARM** and **Intel ABIs**
1. Clone Cordova from https://github.com/apache/incubator-cordova-android into a folder named **cordova**
1. Download [commons-codec][commons-codec] and move it's jar inside Cordova
 * unzip commons-codec-1.6-bin.zip
 * mkdir cordova/framework/libs
 * cp -a commons-codec-1.6/commons-codec-1.6.jar cordova/framework/libs
1. Build the cordova.jar
 * ```cd cordova/framework```
 * ```android update project -p . -t android-15```
 * ```ant jar```
1. Enable cordova tools
 * ```cd cordova/bin```
 * ```npm install```

Create Android Dart Application
-------------------------------

In the cordova folder execute the following commands

```
./bin/create folder/to/create/app/in com.mycompany.app MyApp
cd folder/to/create/app/in
./cordova/emulate
./cordova/debug
```
 
[commons-codec]: http://mirrors.dotsrc.org/apache/commons/codec/binaries/commons-codec-1.6-bin.zip
