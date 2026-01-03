# java

This folder contains the **Java source code used by SDL3**.

The Java files provided here correspond to the **SDL3 version used in this project**.  
You can find these files in the `android-project` directory of the official SDL3 sources.

## Application Entry Point

In addition to the SDL Java files, the `HelloWorldActivity.java` file is included from the **SDL_helloworld** example.

This file is the **entry point of your Android application**, and you will most likely want to modify it to match your own project logic.

## Java Build Process

All Java source files in this folder are:
1. Compiled into `.class` files
2. Merged into a single `classes.dex` file

The resulting `classes.dex` file is later packaged into the final APK.

