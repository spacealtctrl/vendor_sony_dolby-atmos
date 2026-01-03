# Dolby Atmos Vendor Repository - Complete Update

## Update Date: January 3, 2026
## Source: https://github.com/tyty-android/vendor_sony_extra/tree/custom/Yodo/audio

---

## Summary

Complete overhaul of the Dolby Atmos vendor repository with comprehensive audio enhancements including:
- **Dolby Atmos/DAX3** (updated to 3.7.0.8_r1)
- **Sony 360 Reality Audio** support
- **Sound Enhancement** framework
- **Modern Codec2** implementation (replacing legacy stagefright)
- **Enhanced SELinux policies**
- **Android.bp** (Soong) build system support

---

## Build System Changes

### New Files
- `Android.bp` - Modern Soong build system definitions for all modules
- `audio.mk` - Comprehensive makefile with updated paths for vendor/dolby

### Removed Files
- Old `Android.mk` structure (replaced by Android.bp + audio.mk)
- Legacy `dolby.mk` references

### Build System Integration
- **Soong Namespace**: `vendor/dolby`
- **SEPolicy**: Vendor, public, and private sepolicy directories
- **HIDL**: Framework compatibility matrices for Dolby and 360RA
- **Codec2**: Modern C2 audio codec framework with proper dependencies

---

## Applications & APKs

### New Applications (7 total)
1. **DolbySound** (updated) - `proprietary/system_ext/priv-app/DolbySound/`
   - Platform signed, privileged system_ext app
   - Overrides AudioFX and MusicFX
   - Includes odex/vdex precompiled binaries

2. **daxService** (updated) - `proprietary/system_ext/priv-app/daxService/`
   - Dolby Audio eXperience service
   - Platform signed, privileged system_ext app
   - Includes fix-permission.sh script

3. **SoundEnhancement** (NEW) - `proprietary/system_ext/priv-app/SoundEnhancement/`
   - Sony's audio enhancement framework
   - Platform signed, privileged system_ext app

4. **ThreeSixtyRASystem** (NEW) - `proprietary/system_ext/priv-app/ThreeSixtyRASystem/`
   - 360 Reality Audio system service
   - Platform signed, privileged system_ext app

5. **ThreeSixtyRASettings** (NEW) - `proprietary/product/app/ThreeSixtyRASettings/`
   - 360 Reality Audio user settings
   - Product-specific application
   - Includes fix-permission.sh script

6. **ThreeSixtyRASystem-pdx234-Overlay** (NEW) - `proprietary/product/overlay/`
   - Device-specific overlay for pdx234/pdx237
   - Runtime resource overlay (RRO)

7. **com.sony.threesixtyra.audiofx** (NEW) - `proprietary/product/framework/`
   - 360 Reality Audio framework JAR library

---

## Hardware Abstraction Layer (HAL) & Services

### HAL Binaries (3 services)
1. **vendor.dolby.hardware.dms@2.0-service** (updated)
   - Dolby Digital Media Service HIDL interface
   - Location: `proprietary/vendor/bin/hw/`
   - Init: `proprietary/vendor/etc/init/vendor.dolby.hardware.dms@2.0-service.rc`
   - VINTF: `proprietary/vendor/etc/vintf/dms/vendor.dolby.hardware.dms.xml`

2. **vendor.dolby.media.c2@1.0-service** (NEW)
   - Dolby Codec2 media service
   - Location: `proprietary/vendor/bin/hw/`
   - Requires: libcodec2_hidl, libcodec2_vndk, libhidlbase
   - Init: `proprietary/vendor/etc/init/vendor.dolby.media.c2@1.0-service.rc`
   - VINTF: `proprietary/vendor/etc/vintf/dms/vendor.dolby.media.c2@1.0-service.xml`

3. **android.hardware.media.c2@1.0-threesixty-ra-service** (NEW)
   - 360 Reality Audio Codec2 service
   - Location: `proprietary/vendor/bin/hw/`
   - Requires: android.hardware.media.c2, libcodec2_hidl, libcodec2_vndk
   - Init: `proprietary/vendor/etc/init/android.hardware.media.c2@1.0-threesixty-ra-service.rc`
   - VINTF: `proprietary/vendor/etc/vintf/threesixty/vendor.threesixty_ra.codec2.xml`

---

## Shared Libraries

### System_ext Libraries (3 libraries)
1. **libmmparserextractor.so** - Sony MM parser extractor (extractors/)
2. **libavenhancements.so** - Audio/video enhancements
3. **vendor.dolby.hardware.dms@2.0.so** - Dolby DMS HIDL interface

### Vendor Libraries - Core (37 libraries)
**Dolby Core:**
- `libdapparamstorage.so` - DAP parameter storage
- `libdeccfg.so` - Decoder configuration
- `libdlbdsservice.so` - Dolby digital service
- `libdlbpreg.so` - Dolby parameter registry

**Codec2 (Modern - replaces stagefright):**
- `libcodec2_soft_ac4dec.so` - AC-4 decoder
- `libcodec2_soft_ddpdec.so` - Dolby Digital Plus decoder
- `libcodec2_soft_dolby.so` - Dolby codec support
- `libcodec2_soft_mha1dec.so` - MPEG-H Audio decoder
- `libcodec2_soft_mhm1dec.so` - MPEG-H Music decoder
- `libcodec2_soft_common_prebuilt.so` - Common codec components
- `libcodec2_store_dolby.so` - Dolby codec store

**360 Reality Audio:**
- `libiVptApi.so` - Immersive Virtual Positioning Technology API
- `libiVptHkiDec.so` - HKI decoder for 360RA
- `libiVptLibC.so` - 360RA core library
- `libXtcApi.so` - XTC speaker processing
- `libthreesixty_ra_codec2_store.so` - 360RA codec store
- `libtsrspkenhance.so` - Speaker enhancement
- `libupmix-lib.so` - Upmixing library
- `libznr.so` - Zone noise reduction

**Audio Processing:**
- `libaudiokeymgr.so` - Audio key manager
- `libaudiosnpewrapper.so` - SNP enhancement wrapper
- `libaudiosnpewrapper_context.so` - SNP context wrapper
- `liboem_specific.so` - OEM-specific audio
- `librebuffering.so` - Rebuffering support
- `libsfplugin_ccodec_utils_prebuilt.so` - Codec utilities
- `libar-acdb.so` - Audio calibration database

### Vendor Libraries - Sound Effects (13 libraries in soundfx/)
**Dolby:**
- `libdlbvol.so` - Dolby volume leveler
- `libswdap.so` - Software DAP (Dolby Audio Processing)
- `libswgamedap.so` - Game-optimized DAP
- `libswvqe.so` - Voice quality enhancement

**360 Reality Audio:**
- `libtsrspatializer.so` - 3D audio spatializer
- `libtsrupmix.so` - Upmixing effects

**Audio Wrappers:**
- `libbundlewrapper1.so` through `libbundlewrapper4.so` - Effect bundle wrappers
- `libdnnrwrapper.so` - Deep neural noise reduction wrapper
- `libznrwrapper.so` - Zone noise reduction wrapper

### Vendor Libraries - HAL Implementation (2 libraries)
- `vendor.dolby.hardware.dms@2.0-impl.so` - DMS implementation
- `vendor.dolby.hardware.dms@2.0_prebuilt.so` - DMS prebuilt

---

## Configuration Files

### Permissions & Manifests (9 files)
**System_ext permissions:**
- `com.dolby.daxservice.xml` - DAX service permissions
- `com.sony.360ra.xml` - 360RA framework permissions
- `com.sony.threesixtyra.audiofx.xml` - 360RA audio effects permissions
- `com.sonyericsson.soundenhancement.xml` - Sound enhancement permissions
- `jp.co.sony.threesixtyra.system.xml` - 360RA system permissions
- `default-permissions-360ra.apps.xml` - Default 360RA app permissions

**Vendor VINTF manifests:**
- `dolby_framework_matrix.xml` - Dolby framework compatibility matrix
- `threesixty_framework_matrix.xml` - 360RA framework compatibility matrix

### Audio Configuration (11 files)
**Dolby:**
- `dolby/dax-default.xml` - DAX default configuration

**Media Codecs:**
- `media_codecs_dolby_audio.xml` - Dolby audio codec definitions
- `media_codecs_sony_c2_audio.xml` - Sony C2 audio codec definitions
- `seccomp_policy/android.hardware.media.c2@1.2-default-seccomp_policy` - Codec2 security policy

**Sony Audio Enhancement:**
- `XTC_speaker_coef.hki` - XTC speaker coefficients
- `alc.speaker.bin` - Automatic level control
- `dsx_param_file.bin` - DSX parameters
- `windnoise_reduction.data` - Wind noise reduction (front)
- `windnoise_reduction_back.data` - Wind noise reduction (back)
- `windnoise_reduction_stat.data` - Wind noise stats (front)
- `windnoise_reduction_stat_back.data` - Wind noise stats (back)

---

## SELinux Policies

### Public Policies (1 file)
- `sepolicy/public/attributes` - Public SELinux attributes

### Private Policies (2 files)
- `sepolicy/private/seapp_contexts` - App security contexts
- `sepolicy/private/threesixtyra_app.te` - 360RA app type enforcement

### Vendor Policies (13 files)
- `sepolicy/vendor/attributes` - Vendor attributes
- `sepolicy/vendor/file.te` - File type definitions
- `sepolicy/vendor/file_contexts` - File security contexts
- `sepolicy/vendor/hal_audio_default.te` - Audio HAL policies
- `sepolicy/vendor/hal_dms.te` - Dolby DMS HAL type
- `sepolicy/vendor/hal_dms_default.te` - DMS HAL policies
- `sepolicy/vendor/hwservice.te` - Hardware service types
- `sepolicy/vendor/hwservice_contexts` - HW service contexts
- `sepolicy/vendor/mediacodec.te` - Media codec policies
- `sepolicy/vendor/platform_app.te` - Platform app policies
- `sepolicy/vendor/property.te` - Property definitions
- `sepolicy/vendor/property_contexts` - Property contexts
- `sepolicy/vendor/system_server.te` - System server policies
- `sepolicy/vendor/threesixtyra_app.te` - 360RA app vendor policies

---

## System Properties

### Codec2 Properties
```makefile
vendor.audio.c2.preferred=true
debug.c2.use_dmabufheaps=1
vendor.qc2audio.suspend.enabled=true
vendor.qc2audio.per_frame.flac.dec.enabled=true
debug.stagefright.c2inputsurface=-1
```

### Dolby Properties
```makefile
ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1
vendor.audio.dolby.ds2.hardbypass=false
vendor.audio.dolby.ds2.enabled=false
```

### 360 Reality Audio Properties
```makefile
vendor.360ra.effect=1
ro.audio.spatializer_enabled=true
vendor.sony_spatializer.suppress.dolby=true  # ODM property
```

---

## Files Removed (Legacy)

### Removed Directories
- `DolbySound/` - Moved to proprietary/system_ext/priv-app/
- `system/` - Restructured to proprietary/
- `system_support/` - No longer needed (modern HIDL support)
- `unused/` - Integrated into proper locations
- `etc/` - Moved to proprietary/vendor/etc/

### Removed Files (28 files)
- Old permission files from DolbySound/permissions/
- Legacy stagefright libraries (libstagefright_*)
- Old init scripts (init.dolby.rc)
- Audio effects XML for sku_kalama (device-specific, removed)
- Legacy compatibility files
- Old SELinux vendor contexts (replaced with proper sepolicy/)

### Migrated/Renamed Files (10 files)
Files that were moved to new locations with proper directory structure:
- DolbySound.apk → proprietary/system_ext/priv-app/DolbySound/
- Various libraries from system/vendor/lib64/ → proprietary/vendor/lib64/
- Config files → proprietary/vendor/etc/

---

## Integration Points

### Device Tree Integration
Add to device makefile:
```makefile
# Dolby Atmos & 360 Reality Audio
$(call inherit-product, vendor/dolby/audio.mk)
```

### Required Dependencies
- Android 14+ (API level 34+)
- Codec2 HAL support
- HIDL transport support
- Qualcomm audio HAL (references Kalama SoC configs)

### Compatibility
- **Target Devices**: Sony Xperia pdx234 (Xperia 1 V), pdx237 (Xperia 5 V)
- **ROM**: AOSP/LineageOS/crDroid Android 16 compatible
- **Architecture**: ARM64 only (no 32-bit support)

---

## Technical Improvements

### Old → New
1. **Build System**: Android.mk → Android.bp (Soong)
2. **Codec Framework**: Stagefright → Codec2
3. **Dolby Version**: Unknown → DAX3 3.7.0.8_r1
4. **Architecture**: Dolby-only → Dolby + 360RA + Sound Enhancement
5. **SELinux**: Minimal → Comprehensive vendor/private/public policies
6. **Library Structure**: Flat → Organized by partition (system_ext, vendor, product)

### New Features
- 360 Reality Audio support with MPEG-H decoders
- Sony Sound Enhancement framework
- Modern Codec2 HIDL services
- Comprehensive audio calibration (wind noise, ALC, XTC)
- Device-specific RRO overlays
- Enhanced security policies

---

## File Count Summary
- **Total New Files**: 109
- **Deleted Files**: 28
- **Renamed/Moved Files**: 10
- **Modified Files**: 2 (Android.bp, audio.mk with updated paths)

---

## Verification Steps

1. **Build Integration**: Verify PRODUCT_SOONG_NAMESPACES includes vendor/dolby
2. **SEPolicy**: Check sepolicy builds without denials
3. **HAL Services**: Ensure all 3 HAL services start successfully
4. **Audio Codecs**: Test Dolby Digital Plus, AC-4, and MPEG-H playback
5. **Apps**: Verify DolbySound, daxService, and SoundEnhancement install correctly
6. **360RA**: Test 360 Reality Audio playback with compatible content
7. **Permissions**: Confirm all apps have required permissions

---

## Known Integration Points

### SELinux Integration
```makefile
BOARD_VENDOR_SEPOLICY_DIRS += $(LOCAL_AUDIO)/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(LOCAL_AUDIO)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(LOCAL_AUDIO)/sepolicy/private
```

### HIDL Framework Compatibility
```makefile
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/dms/dolby_framework_matrix.xml \
    $(LOCAL_AUDIO)/proprietary/vendor/etc/vintf/threesixty/threesixty_framework_matrix.xml
```

---

## Maintenance Notes

- All files sourced from XperiaLabs vendor_sony_extra repository (custom branch)
- Licensed under Apache License 2.0
- Prebuilt binaries: DO NOT MODIFY (check_elf_files disabled, strip=none)
- Shell scripts require 755 permissions (auto-applied)
- Vendor path updated to: `vendor/dolby`

---

**End of Manifest**
