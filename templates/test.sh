#!/bin/bash
set -e

rm -rf  out.js
dart2js cordova_app.dart

#iOS
rm -rf  ../samples/api/iOS/www/dartgap.js
rm -rf  ../samples/api/iOS/www/index.html
rm -rf  ../samples/api/iOS/www/out.js
rm -rf  ../samples/api/iOS/www/style.css
cp -a ../dartgap.js ../samples/api/iOS/www
cp -a index.html ../samples/api/iOS/www
cp -a out.js ../samples/api/iOS/www
cp -a style.css ../samples/api/iOS/www

# Android
rm -rf  ../samples/api/android/assets/www/dartgap.js
rm -rf  ../samples/api/android/assets/www/index.html
rm -rf  ../samples/api/android/assets/www/out.js
rm -rf  ../samples/api/android/assets/www/style.css
cp -a ../dartgap.js ../samples/api/android/assets/www
cp -a index.html ../samples/api/android/assets/www
cp -a out.js ../samples/api/android/assets/www
cp -a style.css ../samples/api/android/assets/www

