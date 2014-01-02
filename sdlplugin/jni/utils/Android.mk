LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ccsdlplugin

LOCAL_SRC_FILES := utils.c

LOCAL_C_INCLUDES := SDL/include
LOCAL_C_INCLUDES += SDL2_image
LOCAL_C_INCLUDES += SDL2_mixer
LOCAL_C_INCLUDES += SDL2_net
LOCAL_C_INCLUDES += SDL2_ttf

LOCAL_CFLAGS := -O2 -Wall
LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image SDL2_mixer SDL2_net SDL2_ttf
LOCAL_LDLIBS := -lz -llog

include $(BUILD_SHARED_LIBRARY)