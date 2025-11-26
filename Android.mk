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

# daxService app
include $(CLEAR_VARS)
LOCAL_MODULE := daxService
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SRC_FILES := system/priv-app/daxService/daxService.apk
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

# HAL Service
include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0-service
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin/hw
LOCAL_SRC_FILES := system/vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

# HAL Init
include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0-service.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
LOCAL_SRC_FILES := unused/vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc
include $(BUILD_PREBUILT)

# Dolby Config
include $(CLEAR_VARS)
LOCAL_MODULE := dax-default.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/dolby
LOCAL_SRC_FILES := system/vendor/etc/dolby/dax-default.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := media_codecs_dolby_audio.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := system/vendor/etc/media_codecs_dolby_audio.xml
LOCAL_OVERRIDES_MODULES := media_codecs_dolby_audio
include $(BUILD_PREBUILT)

# Vendor libs
include $(CLEAR_VARS)
LOCAL_MODULE := libdapparamstorage
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libdapparamstorage.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libdeccfg
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libdeccfg.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libdlbdsservice
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libdlbdsservice.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libdlbpreg
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libdlbpreg.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libsqlite_dolby
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_MODULE_STEM := libsqlite.so
LOCAL_SRC_FILES := system/vendor/lib64/libsqlite.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libstagefright_fdtn_dolby
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libstagefright_fdtn_dolby.so
LOCAL_MODULE_STEM := libstagefright_foundation.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libstagefright_soft_ac4dec
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libstagefright_soft_ac4dec.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libstagefright_soft_ddpdec
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libstagefright_soft_ddpdec.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libstagefrightdolby
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/libstagefrightdolby.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0-impl
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/vendor.dolby.hardware.dms@2.0-impl.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
LOCAL_SRC_FILES := system/vendor/lib64/vendor.dolby.hardware.dms@2.0.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

# Soundfx libs
include $(CLEAR_VARS)
LOCAL_MODULE := libdlbvol
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64/soundfx
LOCAL_SRC_FILES := system/vendor/lib64/soundfx/libdlbvol.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libswdap
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64/soundfx
LOCAL_SRC_FILES := system/vendor/lib64/soundfx/libswdap.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libswgamedap
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64/soundfx
LOCAL_SRC_FILES := system/vendor/lib64/soundfx/libswgamedap.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libswvqe
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64/soundfx
LOCAL_SRC_FILES := system/vendor/lib64/soundfx/libswvqe.so
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)
