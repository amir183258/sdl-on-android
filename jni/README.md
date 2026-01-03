# jni

This folder contains the **C and C++ source files** that will be compiled using the **Android NDK** into shared libraries (`.so`) for different CPU architectures.

## Source Files

- `main.cpp`  
  This is the **main entry point of your game/application**.  
  You can freely modify this file to implement your own logic.

## NDK Build Files

- `Android.mk`  
- `Application.mk`  

These files are read by the **NDK build system** (`ndk-build`) and define how the native code is compiled.  
You can customize them based on your project requirements (ABIs, STL, compiler flags, etc.).

## Build Output

After running `ndk-build`, the generated `.so` files will be placed in the `libs/` directory at the **root of the project**, organized by architecture (e.g. `arm64-v8a`, `armeabi-v7a`, etc.).

