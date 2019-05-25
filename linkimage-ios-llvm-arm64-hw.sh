#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/loic/graal/substratevm/svmbuild/native-image-root-11
SDK=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.2.sdk
JFXLIB=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/ios-sdk/lib
PWD=`pwd`
BUILDDIR=$PWD/build/ios-arm64
echo "this should contain helloworld.o: $1"
mkdir -p $BUILDDIR
echo "compiling\n=========\n"
gcc -xobjective-c -c -fPIC -arch arm64 -isysroot $SDK -o $BUILDDIR/main.o $PWD/src/native/ios/main.m
gcc -xobjective-c -c -fPIC -arch arm64 -isysroot $SDK -o $BUILDDIR/AppDelegate.o $PWD/src/native/ios/AppDelegate.m
gcc -xobjective-c c -fPIC -arch arm64 -isysroot $SDK -o $BUILDDIR/mythread.o $PWD/src/native/ios/mythread.m
echo "linking\n=======\n"
mkdir -p build/ios/hellofx.app
clang++ -w -o build/ios-arm64/hellofx.app/hellofx \
-arch arm64 \
-Wl,-no_implicit_dylibs \
-Wl,-dead_strip \
-fPIC \
-isysroot $SDK -arch=arm64 -mios-version-min=8.0 \
-Wl,-exported_symbols_list,$PWD/src/native/ios/release.symbols-hw \
$BUILDDIR/AppDelegate.o $BUILDDIR/main.o $BUILDDIR/mythread.o $1/helloworld.o $1/llvm.o \
-L$SVMBUILD/lib/svm/clibraries/darwin-amd64 \
-L$PWD/staticlibs/ios \
-lffi \
-lpthread -lz  -lstrictmath -llibchelper \
-ljava -lnio -lzip -lnet -ljvm \
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
#echo "launching app\n=======\n"
#$PWD/src/native/ios/simlauncher  --udid=F238A21A-03EF-4051-8108-8F3673E3C059 --app-path=$PWD/build/ios/hellofx.app
