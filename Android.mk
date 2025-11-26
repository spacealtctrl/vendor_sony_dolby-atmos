LOCAL_PATH := $(call my-dir)

# DolbySound app
include $(CLEAR_VARS)
LOCAL_MODULE := DolbySound
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SRC_FILES := DolbySound/DolbySound.apk
LOCAL_OVERRIDES_PACKAGES := AudioFX MusicFX
include $(BUILD_PREBUILT)

# Permissions
include $(CLEAR_VARS)
LOCAL_MODULE := default-com.dolby.daxservice.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/default-permissions
LOCAL_SRC_FILES := DolbySound/permissions/default-com.dolby.daxservice.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp-com.dolby.daxservice.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := DolbySound/permissions/privapp-com.dolby.daxservice.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := config-com.dolby.daxservice.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/sysconfig
LOCAL_SRC_FILES := DolbySound/permissions/config-com.dolby.daxservice.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := config-com.dolby.daxappui2.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/sysconfig
LOCAL_SRC_FILES := DolbySound/permissions/config-com.dolby.daxappui2.xml
include $(BUILD_PREBUILT)
