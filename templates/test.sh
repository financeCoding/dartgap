#!/bin/bash
set -e

rm -rf  out.js
rm -rf  ../samples/api/iOS/www/dartgap.js
rm -rf  ../samples/api/iOS/www/index.html
rm -rf  ../samples/api/iOS/www/out.js
rm -rf  ../samples/api/iOS/www/style.css

dart2js cordova_app.dart
cp -a ../dartgap.js ../samples/api/iOS/www
cp -a index.html ../samples/api/iOS/www
cp -a out.js ../samples/api/iOS/www
cp -a style.css ../samples/api/iOS/www
