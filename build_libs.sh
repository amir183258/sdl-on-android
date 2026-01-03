#!/usr/bin/env bash

# this is the main old path
OLD_PATH="$PATH"

# here are you sdk and ndk tools

# we will use ndk-build in this path
export PATH="$PATH:$HOME/Downloads/android-ndk-r27d-linux/android-ndk-r27d"

# this is you jni file with SDL and your main.c/cpp
export NDK_MODULE_PATH="$PWD/jni"

# this path is for using sdkmanager to install tools
export PATH="$PATH:$HOME/Downloads/commandlinetools-linux-13114758_latest/cmdline-tools/latest/bin"

# android api address; you may use different vesrions (30 or 33 for example)
# you have to install this api using sdkmanager
ANDROID_JAR="$HOME/Downloads/commandlinetools-linux-13114758_latest/platforms/android-33/android.jar"
#ANDROID_JAR="$HOME/Downloads/commandlinetools-linux-13114758_latest/platforms/android-30/android.jar"

# build tools path; you have to install this using sdkmanager
# you will use aapt, aapt2 and zipalign in this folder
export PATH="$PATH:$HOME/Downloads/commandlinetools-linux-13114758_latest/build-tools/33.0.2"

# platform-tools path; you will use adb in this path to install your apk on your emulatro
export PATH="$PATH:$HOME/Downloads/commandlinetools-linux-13114758_latest/platform-tools"

# emulator path; you will use emulator in this folder to run an emulator.
# you don't need this to build your app
# export PATH="$PATH:$HOME/Downloads/commandlinetools-linux-13114758_latest/emulator"

echo "* Your PATH variable is set and ready."

# here are building stuff
echo "* Running ndk-build \".so\" files are in libs/."
ndk-build

# after building libs we have to build apk and add libs and other stuff.
# first we copy ./libs/ contents in ./android_build/lib
cp -r ./libs/* ./android_build/lib/
echo "* Library files are ready in android_build/lib/."

# after compiling .so files and copying them into lib,
# we have to build java files. these java files are in
# android-project in sdl3 release. copy them in ./android_build/java
# you also need HelloWorldActivity.java as your main entry point.
# we compile these files into .class files. then finally we compile them
# in classes.dex file. we will use this file in our .apk file as the main
# entry point. I couldn't compile using android-30 but android-33 was OK.
# you have to compile this java files just once.

# first we use javac to compile these files to .class files.
javac -classpath "$ANDROID_JAR" -d ./android_build/classes/ ./android_build/java/*.java
echo "* Class files are ready from java files."

# now we build .dex file. this is final file from java files
#mkdir -p android_build/dex
d8 --lib "$ANDROID_JAR" --output ./android_build/dex $(find ./android_build/classes -name "*.class")
echo "* Final .dex file is read."

# now we compile res folder using aapt2
aapt2 compile --dir ./android_build/res -o ./android_build/compiled_res.zip
echo "* Final res is compiled to compiled_res.zip."

# now we make our initial .apk file
aapt2 link -o ./android_build/app.ap_ --manifest ./android_build/AndroidManifest.xml -I "$ANDROID_JAR" ./android_build/compiled_res.zip --auto-add-overlay
echo "* Initial apk file is ready."

# now we add lib files (.so files)
cd ./android_build/
zip -r ./app.ap_ ./lib/
echo "* Library files (.so files) added to initial apk file."
cd ..

# now we add .dex file to the initial apk file
zip -u -j ./android_build/app.ap_ ./android_build/dex/classes.dex
echo "* .dex file added to initial apk file."

# building final apk file using zipalign
zipalign -f 4 ./android_build/app.ap_ ./build/app-aligned.apk
echo "* Final apk file is ready to sign"

# sign the final apk file
apksigner sign --ks ~/.android/debug.keystore --ks-pass pass:android --key-pass pass:android ./build/app-aligned.apk
echo "* The final apk file is ready."

# finally we install the apk file on our emulator. you have to
# open an emulator before.
adb install -r ./build/app-aligned.apk

# after building we don't need to keep tools in PATH
# so we remove them
export PATH=$OLD_PATH

echo "* Building is finished."
