# ============================================================================
# DOLBY ATMOS - PRODUCT CONFIGURATION
# Full stock-like integration with 32-bit and 64-bit support
# ============================================================================

# Dolby Sound Applications
PRODUCT_PACKAGES += \
    DolbySound \
    daxService

# Permissions & Sysconfig
PRODUCT_PACKAGES += \
    default-com.dolby.daxservice.xml \
    privapp-com.dolby.daxservice.xml \
    config-com.dolby.daxservice.xml \
    config-com.dolby.daxappui2.xml

# HAL Service & Configuration
PRODUCT_PACKAGES += \
    vendor.dolby.hardware.dms@2.0-service \
    vendor.dolby.hardware.dms@2.0-service.rc \
    vendor.dolby.hardware.dms@2.0-service.xml \
    init.dolby.rc

# Dolby Configuration Files
PRODUCT_PACKAGES += \
    dax-default.xml \
    dax-applist.xml \
    media_codecs_dolby_audio.xml \
    media_codecs_dolby

# 64-bit Vendor Libraries
PRODUCT_PACKAGES += \
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
    vendor.dolby.hardware.dms@2.0

# 64-bit Soundfx Libraries
PRODUCT_PACKAGES += \
    libdlbvol \
    libswdap \
    libswgamedap \
    libswvqe

# 32-bit Vendor Libraries
PRODUCT_PACKAGES += \
    libdapparamstorage_32 \
    libdeccfg_32 \
    libdlbpreg_32 \
    libstagefright_fdtn_dolby_32 \
    libstagefright_soft_ac4dec_32 \
    libstagefright_soft_ddpdec_32 \
    libstagefrightdolby_32 \
    vendor.dolby.hardware.dms@2.0_32

# 32-bit Soundfx Libraries
PRODUCT_PACKAGES += \
    libdlbvol_32 \
    libswdap_32 \
    libswgamedap_32 \
    libswvqe_32

# Symlink for libstagefright_foundation.so compatibility
PRODUCT_PACKAGES += \
    libstagefright_foundation_symlink

# Audio Effects Configuration
PRODUCT_COPY_FILES += \
    vendor/dolby/system/vendor/etc/audio/sku_kalama/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_kalama/audio_effects.xml

# SELinux Policy
BOARD_VENDOR_SEPOLICY_DIRS += vendor/dolby/sepolicy

# Framework Compatibility Matrix
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/dolby/dolby_framework_compatibility_matrix.xml

# Dolby system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    ro.dolby.mod_uuid=false \
    ro.dolby.music_stream=false \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false
