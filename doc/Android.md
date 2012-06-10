Getting started on Android
--------------------------

Eclipse Setup
-------------

1. Install Eclipse Classic from: http://www.eclipse.org/downloads
1. In Eclipse install Android tools from https://dl-ssl.google.com/android/eclipse
1. Restart Eclipse and choose to download the latest Android SDK (dialog
   after restart).

Android Cordova Setup
---------------------

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
