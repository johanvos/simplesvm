#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/graal/substratevm/svmbuild/native-image-root-11/
SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk
JFXLIB=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/sdk/lib
PWD=`pwd`
echo "this should contain helloworldsvmjni.o: $1"
mkdir -p $PWD/build/mac
echo "compiling\n=========\n"
gcc -c -o $PWD/build/mac/launcher.o $PWD/src/native/mac/launcher.c
gcc -c -o $PWD/build/mac/AppDelegate.o $PWD/src/native/mac/AppDelegate.m
echo "linking\n=======\n"
gcc -isysroot $SDK -fobjc-arc -o build/mac/helloworldsvmjni  build/mac/AppDelegate.o build/mac/launcher.o $1/helloworldsvmjni.o -L$JFXLIB -L$SVMBUILD/lib/svm/clibraries/darwin-amd64 -L$PWD/staticlibs -lffi -Wl,-framework,CoreFoundation -Wl,-framework,Appkit -lpthread -lz -ldl -lstrictmath -llibchelper -lprism_es2 -ljava -lnio -lzip -lnet /Users/johan/graal/github/fork/graal//substratevm/mxbuild/darwin-amd64/SVM_GRAALVM_SUPPORT/builder/clibraries/darwin-amd64/libjvm.a
echo "running\n=======\n"
#./build/mac/hellofx
