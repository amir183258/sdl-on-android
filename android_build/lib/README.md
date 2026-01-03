# lib

This folder contains the `.so` files generated from compiling the C and C++ source code.

Based on this setup, the **final APK must contain the native shared libraries inside the `lib/` directory**, not `libs/`.  
The `.so` files placed here are **copies of the libraries generated in the root-level `libs/` directory**, which are then packaged into the APK.

Each subdirectory corresponds to a specific CPU architecture (for example: `arm64-v8a`, `armeabi-v7a`, etc.).

