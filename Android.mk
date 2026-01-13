LOCAL_PATH := $(call my-dir)

# =========================================
# APPS (Unique to Android.mk - not in Android.bp)
# =========================================

# SonyMusicFX app
include $(CLEAR_VARS)
LOCAL_MODULE := SonyMusicFX
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SRC_FILES := MusicFX/MusicFX.apk
LOCAL_OVERRIDES_PACKAGES := MusicFX AudioFX
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

# =========================================
# HAL SERVICE (Init scripts - not in Android.bp)
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0-service.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
LOCAL_SRC_FILES := vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0-service.xml-root
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/vintf/manifest
LOCAL_SRC_FILES := vendor.dolby.hardware.dms@2.0-service.xml
include $(BUILD_PREBUILT)

# =========================================
# DOLBY CONFIGS (from system/vendor - unique)
# =========================================

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
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := media_codecs_dolby
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := vendor/etc/media_codecs.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dax-applist.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/dolby
LOCAL_SRC_FILES := system/vendor/etc/dolby/dax-applist.xml
include $(BUILD_PREBUILT)

# =========================================
# DOLBY LIBRARIES (from system/vendor - unique stagefright libs)
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := libsqlite_dolby
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib64
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

# =========================================
# INIT SCRIPTS
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := init.dolby.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := etc/init.dolby.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.media.c2@1.0-threesixty-ra-service.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
LOCAL_SRC_FILES := proprietary/vendor/etc/init/android.hardware.media.c2@1.0-threesixty-ra-service.rc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.media.c2@1.0-service.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init
LOCAL_SRC_FILES := proprietary/vendor/etc/init/vendor.dolby.media.c2@1.0-service.rc
include $(BUILD_PREBUILT)

# =========================================
# SONY STACK - PERMISSIONS (using proprietary paths)
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := com.sony.360ra.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/permissions
LOCAL_SRC_FILES := proprietary/vendor/etc/permissions/com.sony.360ra.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := com.sony.threesixtyra.audiofx.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/permissions
LOCAL_SRC_FILES := proprietary/vendor/etc/permissions/com.sony.threesixtyra.audiofx.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := com.sonyericsson.soundenhancement.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/permissions
LOCAL_SRC_FILES := proprietary/vendor/etc/permissions/com.sonyericsson.soundenhancement.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := default-permissions-360ra.apps.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/default-permissions
LOCAL_SRC_FILES := proprietary/vendor/etc/default-permissions/default-permissions-360ra.apps.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := com.dolby.daxservice.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/permissions
LOCAL_SRC_FILES := proprietary/vendor/etc/permissions/com.dolby.daxservice.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := jp.co.sony.threesixtyra.system.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/permissions
LOCAL_SRC_FILES := proprietary/vendor/etc/permissions/jp.co.sony.threesixtyra.system.xml
include $(BUILD_PREBUILT)

# =========================================
# SONY STACK - DATA FILES (using proprietary paths)
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := windnoise_reduction.data
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := proprietary/vendor/etc/windnoise_reduction.data
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := windnoise_reduction_back.data
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := proprietary/vendor/etc/windnoise_reduction_back.data
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := windnoise_reduction_stat.data
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := proprietary/vendor/etc/windnoise_reduction_stat.data
include $(BUILD_PREBUILT)

# =========================================
# SONY STACK - CONFIG FILES (using proprietary paths)
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := media_codecs_sony_c2_audio.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := proprietary/vendor/etc/media_codecs_sony_c2_audio.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dsx_param_file.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := proprietary/vendor/etc/dsx_param_file.bin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := alc.speaker.bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := proprietary/vendor/etc/alc.speaker.bin
include $(BUILD_PREBUILT)

# =========================================
# RESTORED APK MODULES
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := DolbySound
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SRC_FILES := proprietary/system_ext/priv-app/DolbySound/DolbySound.apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := daxService
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SRC_FILES := proprietary/system_ext/priv-app/daxService/daxService.apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := SoundEnhancement
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SRC_FILES := proprietary/system_ext/priv-app/SoundEnhancement/SoundEnhancement.apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ThreeSixtyRASettings
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := proprietary/product/app/ThreeSixtyRASettings/ThreeSixtyRASettings.apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ThreeSixtyRASystem
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SRC_FILES := proprietary/system_ext/priv-app/ThreeSixtyRASystem/ThreeSixtyRASystem.apk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ThreeSixtyRASystem-pdx234-Overlay
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay
LOCAL_SRC_FILES := proprietary/product/overlay/ThreeSixtyRASystem-pdx234-Overlay.apk
include $(BUILD_PREBUILT)

# =========================================
# RESTORED SERVICE BINARY
# =========================================

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.dolby.hardware.dms@2.0-service
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin/hw
LOCAL_SRC_FILES := proprietary/vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)
