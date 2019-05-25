#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/loic/graal/substratevm/svmbuild/native-image-root-11/
# LLCROOT needs to point to dir that contains llc-aarch64 and libLLVM.dylib (from Drive)
LLCROOT=/Users/johan/graal/llvm/customaarch64
# Note: clibraries still point to amd. We only need the header files in compilation
#JFXLIB=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/ios-sdk/lib
PWD=`pwd`
SVMLIB=$SVMBUILD/lib
echo "Compile src\n============"
javac -d class src/java/HelloWorld.java
echo "Done\nRunning native-image now"
java \
-XX:+UnlockExperimentalVMOptions \
-XX:+EnableJVMCI \
-XX:-UseJVMCICompiler \
-Dtruffle.TrustAllTruffleRuntimeProviders=true \
-Dsubstratevm.IgnoreGraalVersionCheck=true \
-Djava.lang.invoke.stringConcat=BC_SB \
-Dtargetos.name=iOS \
-Dgraalvm.version=1.0.0-rc18-SNAPSHOT \
-Dorg.graalvm.version=1.0.0-rc18-SNAPSHOT \
-Dorg.graalvm.config= \
-Dcom.oracle.graalvm.isaot=true \
-Dsvm.platform=org.graalvm.nativeimage.Platform\$DARWIN_AArch64 \
-Dsvm.targetArch=arm \
-Dsvm.llvm.root=$LLCROOT \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.runtime=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.code=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.aarch64=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.amd64=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.meta=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.hotspot=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.services=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.common=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.code.site=ALL-UNNAMED \
--add-opens jdk.unsupported/sun.reflect=ALL-UNNAMED \
--add-opens java.base/jdk.internal.module=ALL-UNNAMED \
--add-opens java.base/jdk.internal.ref=ALL-UNNAMED \
--add-opens java.base/jdk.internal.reflect=ALL-UNNAMED \
--add-opens java.base/java.lang=ALL-UNNAMED \
--add-opens java.base/java.lang.invoke=ALL-UNNAMED \
--add-opens java.base/java.lang.ref=ALL-UNNAMED \
--add-opens java.base/java.net=ALL-UNNAMED \
--add-opens java.base/java.nio=ALL-UNNAMED \
--add-opens java.base/java.util=ALL-UNNAMED \
--add-opens org.graalvm.sdk/org.graalvm.nativeimage.impl=ALL-UNNAMED \
-Xss10m -Xms1g -Xmx13441813704 -Duser.country=US -Duser.language=en \
-Dgraalvm.version=1.0.0-rc13-gvm11-SNAPSHOT \
-Xdebug \
-Xrunjdwp:transport=dt_socket,server=y,address=8000,suspend=n \
-Dorg.graalvm.version=1.0.0-rc13-gvm11-SNAPSHOT \
-Dcom.oracle.graalvm.isaot=true \
--module-path $SVMLIB/jvmci/graal-sdk.jar:$SVMLIB/truffle/truffle-api.jar \
--upgrade-module-path $SVMLIB/jvmci/graal.jar \
-cp $SVMLIB/jvmci/graal-sdk.jar:$SVMLIB/jvmci/graal.jar:$SVMLIB/svm/builder/llvm-wrapper.jar:$SVMLIB/svm/builder/objectfile.jar:$SVMLIB/svm/builder/pointsto.jar:$SVMLIB/svm/builder/svm.jar:$SVMLIB/svm/builder/javacpp.jar:$SVMLIB/svm/builder/graal-llvm.jar:$SVMLIB/svm/builder/svm-llvm.jar:$SVMLIB/svm/builder/llvm-platform-specific.jar \
com.oracle.svm.hosted.NativeImageGeneratorRunner \
-imagecp $SVMLIB/jvmci/graal-sdk.jar:$SVMLIB/jvmci/graal.jar:$SVMLIB/svm/builder/llvm-wrapper.jar:$SVMLIB/svm/builder/objectfile.jar:$SVMLIB/svm/builder/pointsto.jar:$SVMLIB/svm/builder/svm.jar:$SVMLIB/svm/builder/javacpp.jar:$SVMLIB/svm/builder/graal-llvm.jar:$SVMLIB/svm/builder/svm-llvm.jar:$SVMLIB/svm/builder/llvm-platform-specific.jar:$SVMLIB/svm/library-support.jar:$PWD/class \
-H:Path=$PWD/image \
-H:Class=HelloWorld \
-H:+ReportExceptionStackTraces \
-H:+SharedLibrary \
-H:TempDirectory=$PWD/tmp \
-H:Name=helloworld \
-H:IncludeResources=.*/.*frag$ \
-H:IncludeResources=.*/.*fxml$ \
-H:IncludeResources=.*/.*css$ \
-H:IncludeResources=.*/.*gls$ \
-H:IncludeResources=.*/.*ttf$ \
-H:IncludeResources=.*/.*png$ \
-H:IncludeResources=.*png$ \
-H:IncludeResources=.*css$ \
-H:+ReportUnsupportedElementsAtRuntime \
-H:+AllowIncompleteClasspath \
-H:CompilerBackend=llvm \
-H:-SpawnIsolates \
-H:CLibraryPath=$SVMLIB/svm/clibraries/darwin-amd64

