# Dolby Sound
# Include Android.mk to define modules (explicit include to ensure correct path resolution)
include $(call my-dir)/Android.mk

PRODUCT_PACKAGES += \
    SonyMusicFX \
    DolbySound \
    daxService \
    default-com.dolby.daxservice.xml \
    privapp-com.dolby.daxservice.xml \
    config-com.dolby.daxservice.xml \
    config-com.dolby.daxappui2.xml \
    vendor.dolby.hardware.dms@2.0-service \
    vendor.dolby.hardware.dms@2.0-service.rc \
    vendor.dolby.hardware.dms@2.0-service.xml \
    dax-default.xml \
    media_codecs_dolby_audio.xml \
    media_codecs_dolby \
    dax-applist.xml \
    libdapparamstorage \
    libdeccfg \
    libdlbdsservice \
    libdlbpreg \
    libsqlite_dolby \
    libstagefright_fdtn_dolby \
    libstagefright_soft_ac4dec \
    libstagefright_soft_ddpdec \
    libstagefrightdolby \
    vendor.dolby.hardware.dms@2.0-impl \
    vendor.dolby.hardware.dms@2.0 \
    libdlbvol \
    libswdap \
    libswgamedap \
    libswvqe \
    init.dolby.rc \
    com.sony.threesixtyra.audiofx \
    libavenhancements \
    libznrwrapper \
    libmmparserextractor \
    com.sony.360ra.xml \
    com.sony.threesixtyra.audiofx.xml \
    com.sonyericsson.soundenhancement.xml \
    windnoise_reduction.data \
    windnoise_reduction_back.data \
    windnoise_reduction_stat.data \
    media_codecs_sony_c2_audio.xml \
    dsx_param_file.bin \
    alc.speaker.bin \
    ThreeSixtyRASettings \
    ThreeSixtyRASystem \
    ThreeSixtyRASystem-pdx234-Overlay \
    SoundEnhancement

PRODUCT_COPY_FILES += \
    system/vendor/etc/audio/sku_kalama/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/audio_effects.xml \
    MusicFX/permissions/privapp-permissions-musicfx.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-musicfx.xml \
    etc/sysconfig/musicfx_hidden.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/musicfx_hidden.xml \
    vendor/dolby/etc/XTC_speaker_coef.hki:$(TARGET_COPY_OUT_VENDOR)/etc/XTC_speaker_coef.hki

BOARD_VENDOR_SEPOLICY_DIRS += vendor/dolby/sepolicy

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/dolby/dolby_framework_compatibility_matrix.xml

# Dolby system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    ro.dolby.mod_uuid=false \
    ro.dolby.music_stream=false \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false

# Sony Audio & DSEE Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sony.dseehx.supported=true \
    ro.sony.dsx.supported=true \
    persist.vendor.audio.sony.dseehx.enable=1 \
    ro.somc.dseehx.supported=true
