#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/graal/substratevm/svmbuild/native-image-root-11/
SDK=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk
JFX=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/macosx-sdk/lib
PWD=`pwd`
echo "this should contain helloworldsvmjni.o: $1"
mkdir -p $PWD/build/mac
echo "compiling\n=========\n"
gcc -c -o $PWD/build/mac/launcher.o $PWD/src/native/mac/launcher.c
gcc -c -o $PWD/build/mac/AppDelegate.o $PWD/src/native/mac/AppDelegate.m
echo "linking\n=======\n"
echo "gcc -ObjC -isysroot $SDK -iframework$SDK/System/Library/Frameworks -arch x86_64 -o build/mac/hellofxsvm -Wl,-exported_symbols_list,release.symbols build/mac/AppDelegate.o build/mac/launcher.o $1/hellofxsvm.o -L$SVMBUILD/lib/svm/clibraries/darwin-amd64 -L$PWD/staticlibs -lffi -lpthread -lz -ldl -lstrictmath -llibchelper -lprism_es2 -lglass -ljavafx_font -ljava -lnio -lzip -lnet /Users/johan/graal/github/fork/graal//substratevm/mxbuild/darwin-amd64/SVM_GRAALVM_SUPPORT/builder/clibraries/darwin-amd64/libjvm.a -Wl,-framework,Foundation -Wl,-framework,AppKit -Wl,-framework,ApplicationServices -Wl,-framework,OpenGL -Wl,-framework,QuartzCore -Wl,-framework,Security -lobjc"
gcc -ObjC -isysroot $SDK -iframework$SDK/System/Library/Frameworks -arch x86_64 -o build/mac/hellofxsvm -Wl,-exported_symbols_list,release.symbols build/mac/AppDelegate.o build/mac/launcher.o $1/hellofxsvm.o -L$SVMBUILD/lib/svm/clibraries/darwin-amd64 -L$PWD/staticlibs -L$JFX -lffi -lpthread -lz -ldl -lstrictmath -llibchelper -lprism_es2 -lglass -ljavafx_font -ljava -lnio -lzip -lnet -ljvm -Wl,-framework,Foundation -Wl,-framework,AppKit -Wl,-framework,ApplicationServices -Wl,-framework,OpenGL -Wl,-framework,QuartzCore -Wl,-framework,Security -lobjc
echo "running\n=======\n"
#./build/mac/hellofx
