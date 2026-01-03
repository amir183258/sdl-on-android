# SDL on Android

## Project Overview

This project demonstrates how to use **SDL (Simple DirectMedia Layer)** on the **Android operating system**.  

Typically, developers use build tools like **Gradle** or **CMake** to integrate SDL into Android projects.  
In this repository, however, the entire process is performed **manually**, which was an extremely educational experience for me.

The `build_libs.sh` script outlines all the steps required to build the project.  
It is highly recommended to review **all the files in this repository** to fully understand how the system works and how you can adapt it to your own projects. Here are some screenshots showing the project on emulator:
<div style="display: flex; gap: 10px;">

  <img src="screenshot_1.png" alt="Screenshot 1" width="45%">
  <img src="screenshot_2.png" alt="Screenshot 2" width="45%">
</div>

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

### Android Command Line Tools

To manage Android SDK packages and emulators, you will need the **Android Command Line Tools**.  

You can download them from the official page:  
[https://developer.android.com/tools](https://developer.android.com/tools)  

In this project, I used **commandlinetools-linux-13114758_latest**.  
After downloading, **extract the archive** and explore the folder.  

The Command Line Tools include two main utilities:

- `sdkmanager`: used to install other SDK components.  
- `avdmanager`: used to create and manage Android Virtual Devices (emulators).  

---

#### Installing Required SDK Packages

Using `sdkmanager`, you should install the following components:

1. `build-tools`  
   - Contains essential tools like `aapt2` and `zipalign` to build the final APK.  

2. `emulator`  
   - Contains the `emulator` tool to run a virtual Android device and test your application.  

3. `platform-tools`  
   - Contains the `adb` tool, which is used to install and debug APKs on an emulator or real device.  

4. `platforms`  
   - Make sure to install **Android 33 or higher**.  
   - Note: The SDL3 Java code in this project did **not compile with Android 30** for me.

> 💡 Tip: You can easily explore the contents of all these folders to familiarize yourself with the tools.

---

#### Notes

- How to use `sdkmanager` to install these packages and create an emulator is straightforward.  
- You can find instructions online; you will likely not encounter any issues.  

---

Here is a visual overview of my `commandlinetools` folder:

![Command Line Tools folder](commandlinetools.png)

