#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/graal/substratevm/svmbuild/native-image-root-11/
SDK=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator12.2.sdk
JFXLIB=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/ios-sdk/lib
PWD=`pwd`
echo "this should contain hellofxsvm.o: $1"
mkdir -p $PWD/build/ios
echo "compiling\n=========\n"
gcc -c -isysroot $SDK -o $PWD/build/ios/main.o $PWD/src/native/ios/main.m
gcc -c -isysroot $SDK -o $PWD/build/ios/AppDelegate.o $PWD/src/native/ios/AppDelegate.m
echo "linking\n=======\n"
mkdir -p build/ios/hellofx.app
clang++ -w -o build/ios/hellofx.app/hellofx \
-Wl,-no_implicit_dylibs \
-Wl,-dead_strip \
-fPIC \
-isysroot $SDK -arch x86_64 -mios-version-min=8.0 \
-Wl,-exported_symbols_list,$PWD/src/native/ios/release.symbols \
-Wl,-all_load,$JFXLIB/libprism_es2.a \
-Wl,-all_load,$JFXLIB/libglass.a \
-Wl,-all_load,$JFXLIB/libjavafx_font.a \
build/ios/AppDelegate.o build/ios/main.o $1/hellofxsvm.o -L$SVMBUILD/lib/svm/clibraries/darwin-amd64 -lffi \
-lpthread -lz  -lstrictmath -llibchelper \
-Wl,-framework,Foundation \
-Wl,-framework,CoreGraphics \
-Wl,-framework,OpenGLES \
-Wl,-framework,MobileCoreServices \
-Wl,-framework,CoreText \
-Wl,-framework,ImageIO \
-Wl,-framework,UserNotifications \
-Wl,-framework,CoreBluetooth \
-Wl,-framework,CoreLocation \
-Wl,-framework,CoreMedia \
-Wl,-framework,AVFoundation \
-Wl,-framework,Accelerate \
-Wl,-framework,CoreVideo \
-Wl,-framework,QuartzCore \
-Wl,-framework,UIKit
echo "preparing app\n=======\n"
cp src/native/ios/Info.plist build/ios/hellofx.app
echo "launching app\n=======\n"
$PWD/src/native/ios/simlauncher  --udid=C3E4154D-00E8-4656-A284-FE9073ECAA10 --app-path=$PWD/build/ios/hellofx.app
