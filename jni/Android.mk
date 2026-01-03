LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sdl-helloworld

LOCAL_SRC_FILES := main.cpp

LOCAL_SHARED_LIBRARIES := SDL3

LOCAL_LDLIBS := -llog -landroid -lEGL -lGLESv2

include $(BUILD_SHARED_LIBRARY)

# import SDL3 module
$(call import-module,SDL3)

