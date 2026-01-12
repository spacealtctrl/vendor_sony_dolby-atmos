# Dolby Sound
PRODUCT_PACKAGES += \
    SonyMusicFX \
    DolbySound \
    daxService \
    ThreeSixtyRASettings \
    ThreeSixtyRASystem-pdx234-Overlay \
    ThreeSixtyRASystem \
    SoundEnhancement \
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
    default-permissions-360ra.apps.xml \
    com.dolby.daxservice.xml \
    jp.co.sony.threesixtyra.system.xml \
    windnoise_reduction.data \
    windnoise_reduction_back.data \
    windnoise_reduction_stat.data \
    media_codecs_sony_c2_audio.xml \
    dsx_param_file.bin \
    alc.speaker.bin \
    libXtcApi \
    libaudiokeymgr \
    libaudiosnpewrapper \
    libaudiosnpewrapper_context \
    libcodec2_soft_ac4dec \
    libcodec2_soft_common_prebuilt \
    libcodec2_soft_ddpdec \
    libcodec2_soft_dolby \
    libcodec2_soft_mha1dec \
    libcodec2_soft_mhm1dec \
    libcodec2_store_dolby \
    libiVptApi \
    libiVptHkiDec \
    libiVptLibC \
    liboem_specific \
    librebuffering \
    libsfplugin_ccodec_utils_prebuilt \
    libthreesixty_ra_codec2_store \
    libtsrspkenhance \
    libupmix-lib \
    libznr \
    vendor.dolby.hardware.dms@2.0_prebuilt \
    libbundlewrapper1 \
    libbundlewrapper2 \
    libbundlewrapper3 \
    libbundlewrapper4 \
    libdnnrwrapper \
    libtsrspatializer \
    libtsrupmix \
    vendor.dolby.hardware.dms@2.0-system_ext \
    android.hardware.media.c2@1.0-threesixty-ra-service \
    android.hardware.media.c2@1.0-threesixty-ra-service.rc \
    vendor.dolby.media.c2@1.0-service \
    vendor.dolby.media.c2@1.0-service.rc \
    vendor.dolby.media.c2@1.0-service.xml \
    com.dolby.daxservice.xml-etc \
    com.sony.threesixtyra.audiofx-framework \
    libavenhancements-vendor \
    libmmparserextractor-vendor \
    libar-acdb

PRODUCT_COPY_FILES += \
    system/vendor/etc/audio/sku_kalama/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/audio_effects.xml \
    MusicFX/permissions/privapp-permissions-musicfx.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-musicfx.xml \
    etc/sysconfig/musicfx_hidden.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/musicfx_hidden.xml

BOARD_SEPOLICY_DIRS += vendor/dolby/sepolicy

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
