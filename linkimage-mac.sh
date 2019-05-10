#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/graal/substratevm/svmbuild/native-image-root-11/
SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk
JFXLIB=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/sdk/lib
PWD=`pwd`
echo "this should contain hellofxsvm.o: $1"
mkdir -p $PWD/build/mac
echo "compiling\n=========\n"
gcc -c -o $PWD/build/mac/launcher.o $PWD/src/native/mac/launcher.c
gcc -c -o $PWD/build/mac/AppDelegate.o $PWD/src/native/mac/AppDelegate.m
echo "linking\n=======\n"
echo "-isysroot $SDK -fobjc-arc -o build/mac/hellofx  build/mac/AppDelegate.o build/mac/launcher.o $1/hellofxsvm.o -L$JFXLIB -L$SVMBUILD/lib/svm/clibraries/darwin-amd64 -lffi -Wl,-framework,CoreFoundation -Wl,-framework,Appkit -lpthread -lz -ldl -lstrictmath -llibchelper -lprism_es2"
#gcc -isysroot $SDK -fobjc-arc -o build/mac/hellofx  build/mac/AppDelegate.o build/mac/launcher.o $1/hellofxsvm.o -L$JFXLIB -L$SVMBUILD/lib/svm/clibraries/darwin-amd64 -lffi -Wl,-framework,CoreFoundation -Wl,-framework,Appkit -lpthread -lz -ldl -lstrictmath -llibchelper -lprism_es2
echo "running\n=======\n"
./build/mac/hellofx
