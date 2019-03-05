#!/bin/sh
SVMBUILD=/Users/johan/graal/github/fork/graal/substratevm/svmbuild/native-image-root-11/
JFXLIB=/Users/johan/open-jfx/github/forks/openjdk-jfx/build/sdk/lib
PWD=`pwd`
SVMLIB=$SVMBUILD/lib
echo "Compile src\n============"
javac -p $JFXLIB --add-modules javafx.controls -d class src/HelloFX.java
echo "Done\nRunning native-image now"
java \
-XX:+UnlockExperimentalVMOptions \
-XX:+EnableJVMCI \
-XX:-UseJVMCICompiler \
-Dtruffle.TrustAllTruffleRuntimeProviders=true \
-Dsubstratevm.IgnoreGraalVersionCheck=true \
-Djava.lang.invoke.stringConcat=BC_SB \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.runtime=ALL-UNNAMED \
--add-exports jdk.internal.vm.ci/jdk.vm.ci.code=ALL-UNNAMED \
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
-cp $SVMLIB/jvmci/graal-sdk.jar:$SVMLIB/jvmci/graal.jar:$SVMLIB/svm/builder/objectfile.jar:$SVMLIB/svm/builder/pointsto.jar:$SVMLIB/svm/builder/svm.jar com.oracle.svm.hosted.NativeImageGeneratorRunner \
-imagecp $SVMLIB/jvmci/graal-sdk.jar:$SVMLIB/jvmci/graal.jar:$SVMLIB/svm/builder/objectfile.jar:$SVMLIB/svm/builder/pointsto.jar:$SVMLIB/svm/builder/svm.jar:$SVMLIB/svm/library-support.jar:$JFXLIB/javafx.base.jar:$JFXLIB/javafx.graphics.jar:$JFXLIB/javafx.controls.jar:$PWD/class \
-H:Path=$PWD/image \
-H:CLibraryPath=$SVMLIB/svm/clibraries/darwin-amd64 \
-H:Class=HelloFX \
-H:ReflectionConfigurationFiles=reflectionconfig-mac.json \
-H:JNIConfigurationFiles=jniconfig-mac.json \
-H:+ReportExceptionStackTraces \
-H:Kind=SHARED_LIBRARY \
-H:TempDirectory=$PWD/tmp \
-H:DelayClassInitialization=javafx.scene.CssStyleHelper \
-H:DelayClassInitialization=com.sun.prism.es2.ES2VramPool \
-H:DelayClassInitialization=com.sun.javafx.iio.jpeg.JPEGImageLoader \
-H:DelayClassInitialization=com.sun.javafx.scene.control.LabeledText \
-H:DelayClassInitialization=com.sun.prism.es2.ES2Pipeline \
-H:DelayClassInitialization=com.sun.javafx.tk.quantum.ViewPainter \
-H:DelayClassInitialization=com.sun.javafx.tk.quantum.PresentingPainter \
-H:DelayClassInitialization=com.sun.javafx.tk.quantum.UploadingPainter \
-H:DelayClassInitialization=com.sun.prism.impl.ps.BaseShaderContext \
-H:DelayClassInitialization=com.sun.prism.impl.ps.PaintHelper \
-H:RerunClassInitialization=com.sun.javafx.font.PrismFontFactory \
-H:RerunClassInitialization=com.sun.javafx.font.PrismFontLoader \
-H:NumberOfThreads=1 \
-H:Name=hellofxsvm \
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
-H:EnableURLProtocols=resource
echo "Native-image created\nRun the application now"
./image/hellofxsvm


