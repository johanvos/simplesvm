#!/bin/sh
SVMBUILD=/home/johan/graal/github/fork/graal/vm/mxbuild/linux-amd64/GRAALVM_SVM/graalvm-svm-20.0.0-beta.01-dev
JFXLIB=/home/johan/open-jfx/github/forks/openjdk-jfx/build/sdk/lib
PWD=`pwd`
echo "this should contain helloworldsvmjni.o: $1"
mkdir -p $PWD/build/linux
echo "compiling\n=========\n"
gcc -c -o $PWD/build/linux/launcher.o $PWD/src/native/linux/launcher.c
echo "linking\n=======\n"
gcc -o build/linux/helloworldsvmjni build/linux/launcher.o $1/helloworldsvmjni.o -L$JFXLIB -L$SVMBUILD/lib/svm/clibraries/linux-amd64 -L$PWD/staticlibs/linux -lffi -lpthread -lz -ldl -lstrictmath -llibchelper  -ljava -lnio -lzip -lnet -lj2pkcs11 -lsunec -ljvm -lz
echo "running\n=======\n"
#./build/mac/hellofx
