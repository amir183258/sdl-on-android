# android_build

This folder contains all files that are eventually **assembled into the final APK**.

## Android Manifest and Resources

- `AndroidManifest.xml`  
  This file is provided by the original **SDL_helloworld** example.  
  You may want to modify it depending on your application needs (permissions, orientation, metadata, etc.).

- `res/`  
  This resources folder also comes from the SDL example.  
  You can customize icons, styles, and other Android resources here.

## Native Libraries

- `lib/`  
  This folder contains the compiled native shared libraries (`.so` files) produced by the Android NDK, organized per ABI.

## Java Sources and Build Output

- `java/`  
  Contains the **Java source code used by SDL** itself.

- `classes/` and `dex/`  
  These directories store the **compiled Java bytecode and DEX files** generated during the Java build process.

## More Information

For detailed information about each subdirectory, refer to the `README.md` file inside the corresponding folder.

