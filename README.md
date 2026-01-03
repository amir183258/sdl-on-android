# SDL on Android

## Project Overview

This project demonstrates how to use **SDL (Simple DirectMedia Layer)** on the **Android operating system**.  

Typically, developers use build tools like **Gradle** or **CMake** to integrate SDL into Android projects.  
In this repository, however, the entire process is performed **manually**, which was an extremely educational experience for me.

The `build_libs.sh` script outlines all the steps required to build the project.  
It is highly recommended to review **all the files in this repository** to fully understand how the system works and how you can adapt it to your own projects. Here are some screenshots showing the project on emulator:

![Screenshot 1](screenshot_1.png)

![Screenshot 2](screenshot_2.png)

In the sections below, I will walk you through the process step by step.

## Section 1: Prerequisites

Before building the project, make sure you have the following tools installed.

### Android NDK

To build the **C and C++ source files** for Android, you will need the **Android NDK**.

In this project, I used **android-ndk-r27d-linux**.  

You can download the NDK from the official Android page:  
[https://developer.android.com/ndk/downloads](https://developer.android.com/ndk/downloads)

After downloading, **extract the archive** to a suitable location.  
We will be using the `ndk-build` tool from the NDK to compile the native C/C++ code.

