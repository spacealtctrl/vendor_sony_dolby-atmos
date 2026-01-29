# Dolby Sound
PRODUCT_PACKAGES += \
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
    init.sony-platform.rc

PRODUCT_COPY_FILES += \
    vendor/dolby/system/vendor/etc/audio/sku_kalama/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/audio_effects.xml

BOARD_VENDOR_SEPOLICY_DIRS += vendor/dolby/sepolicy

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/dolby/dolby_framework_compatibility_matrix.xml

# Dolby system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    ro.dolby.mod_uuid=false \
    ro.dolby.music_stream=false \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false

# 360 Reality Audio
PRODUCT_PACKAGES += \
    ThreeSixtyRASystem \
    com.sony.threesixtyra.audiofx \
    com.sony.threesixtyra.audiofx.xml \
    default-jp.co.sony.threesixtyra.system.xml \
    privapp-jp.co.sony.threesixtyra.system.xml \
    config-jp.co.sony.threesixtyra.system.xml \
    libupmix-lib \
    libtsrupmix

# 360RA Boot JAR
# PRODUCT_BOOT_JARS += \
#     com.sony.threesixtyra.audiofx

# 360RA system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=log

# Bypass verify_uses_libraries check for prebuilt APKs
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
