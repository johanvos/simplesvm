# simplesvm

This project runs the most simple Hello, FX sample using SVM

## Running on Linux

### requirements ==

SubstrateVM, including PR#1021, #1027, #1031 and #1037

OpenJFX: get repo at https://github.com/johanvos/openjdk-jfx/tree/develop-svm
or get a binary sdk from https://drive.google.com/file/d/1R-KMZev6DZAUVaJsO_SIfgaasMgflnTn/view?usp=sharing

Java 11 or beyond (tested with 11.0.2)

Modify createimage-linux.sh so that it has valid values for SVMBUILD and JFXLIB

### compile and run

`sh createimage-linux.sh`

## Running om Mac

### requirements ==

SubstrateVM, including PR#1021, #1027, #1031 and #1037

OpenJFX: get repo at https://github.com/johanvos/openjdk-jfx/tree/develop-svm
or get a binary sdk from https://drive.google.com/file/d/1cWQY4Cj1CAnwCT6dJV4ToyVtp7dRTboS/view?usp=sharing

Java 11 or beyond (tested with 11.0.2)

Modify createimage-mac.sh so that it has valid values for SVMBUILD and JFXLIB
Modify linkimage-mac.sh so that it has valid values for SVMBUILD and SDK

### compile and run

`sh createimage-mac.sh`

This creates a tmp/SVMXXXXX dir that has to be supplied to the next command:

`sh linkimage-mac.sh tmp/SVMXXXXXX`

