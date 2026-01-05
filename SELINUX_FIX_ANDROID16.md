# Dolby DMS HAL SELinux Fix for Android 16

## Overview
This fix resolves the issue where the Dolby DMS (Dolby Media Server) HAL cannot register with `hwservicemanager` in Android 16 due to stricter SELinux neverallow rules.

## Problem Statement
- **Symptom**: DMS HAL shows as `?` in `lshal` output instead of `I` (Initialized)
- **Root Cause**: Android 16 enforces stricter neverallow rules that prevent `hal_audio_default` domain from using the `add` permission for `hwservice_manager`
- **Impact**: DolbySound app features don't work (toggle is greyed out)

## Solution
The fix creates a dedicated `hal_dms_default` domain for the DMS HAL and configures proper SELinux policies for Android 16 compliance.

## Files Modified/Created

### Public SEPolicy
1. **sepolicy/public/attributes**
   - Added `hal_dms`, `hal_dms_client`, and `hal_dms_server` attributes
   - Makes these attributes available to both system and vendor policies

### Vendor SEPolicy
2. **sepolicy/vendor/hal_dms.te**
   - Defines binder communication rules between DMS HAL clients and servers
   - Grants `add_hwservice` permission to `hal_dms_server`
   - Allows `hal_dms_client` to find the DMS hwservice

3. **sepolicy/vendor/hal_dms_default.te** (CRITICAL)
   - Defines the `hal_dms_default` domain
   - **Critical for Android 16**: Uses `hal_attribute_hwservice()` macro
   - **Critical for Android 16**: Grants `add_hwservice()` permission to `hal_dms_default`
   - Allows binder communication with audio HAL and apps
   - Grants file access permissions for Dolby data directories

4. **sepolicy/vendor/hwservice.te**
   - Defines `hal_dms_hwservice` type

5. **sepolicy/vendor/file.te**
   - Defines `vendor_dolby_data_file` type for Dolby data directory

6. **sepolicy/vendor/file_contexts**
   - Labels DMS service binary: `/vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service`
   - Labels Dolby data directory: `/data/vendor/dolby`

7. **sepolicy/vendor/hwservice_contexts**
   - Registers DMS hwservice: `vendor.dolby.hardware.dms@2.0::IDms/default`
   - **Fixed**: Added version `@2.0` (was missing before)

8. **sepolicy/vendor/audioserver.te**
   - Allows audioserver to be a DMS HAL client
   - Grants permission to find DMS hwservice

9. **sepolicy/vendor/system_app.te**
   - Allows system apps (like DolbySound) to access DMS HAL

10. **sepolicy/vendor/priv_app.te**
    - Allows privileged apps to access DMS HAL

11. **sepolicy/vendor/untrusted_app.te**
    - Allows untrusted apps to find DMS hwservice (if needed)

12. **sepolicy/vendor/platform_app.te** (already existed)
    - Allows platform apps to access DMS HAL

13. **sepolicy/vendor/hal_audio_default.te** (already existed)
    - Allows audio HAL to be a DMS client

## Integration with Device Tree

### Option 1: Using device.mk (Recommended)
If you want to include the sepolicy in your device tree, add this to your device's `device.mk`:

\`\`\`makefile
# Dolby Atmos SELinux Policies
BOARD_VENDOR_SEPOLICY_DIRS += vendor/dolby/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += vendor/dolby/sepolicy/public
\`\`\`

### Option 2: Using BoardConfig.mk
Alternatively, add this to your device tree's `BoardConfigCommon.mk` or `BoardConfig.mk`:

\`\`\`makefile
# Dolby Atmos SELinux Policies
BOARD_VENDOR_SEPOLICY_DIRS += vendor/dolby/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += vendor/dolby/sepolicy/public
\`\`\`

**Note**: Since your Dolby vendor repo is cloned to `vendor/dolby/` (not `vendor/sony/dolby-atmos/`), the paths above are correct.

## Build Instructions

1. **Clean build required**: SELinux policy changes require a clean build
   \`\`\`bash
   make clean
   # or for faster clean:
   rm -rf out/target/product/pdx234/obj/ETC/plat_sepolicy*
   rm -rf out/target/product/pdx234/obj/ETC/vendor_sepolicy*
   \`\`\`

2. **Build the ROM**:
   \`\`\`bash
   . build/envsetup.sh
   lunch lineage_pdx234-userdebug
   make bacon -j$(nproc --all)
   \`\`\`

3. **Check for sepolicy errors**:
   - Build will fail if there are neverallow violations
   - Look for errors mentioning "neverallow" in the build log

## Verification After Flashing

### 1. Check HAL Registration
\`\`\`bash
adb shell lshal | grep dolby
\`\`\`

**Expected output**:
\`\`\`
DM,FC I vendor.dolby.hardware.dms@2.0::IDms/default 1234 2
      ↑ "I" means Initialized (working!)
\`\`\`

**Before fix** (broken):
\`\`\`
DM,FC ? vendor.dolby.hardware.dms@2.0::IDms/default N/A N/A
      ↑ "?" means registration failed
\`\`\`

### 2. Check hwservicemanager
\`\`\`bash
adb shell "dumpsys hwservicemanager | grep dolby"
\`\`\`

**Expected output**:
\`\`\`
vendor.dolby.hardware.dms@2.0::IDms/default: [hal_dms_default]
\`\`\`

### 3. Check for SELinux Denials
\`\`\`bash
# Check kernel log
adb shell "dmesg | grep avc | grep dolby"

# Check logcat
adb logcat -d | grep "avc.*dolby"
\`\`\`

**Expected**: No denials related to Dolby

### 4. Check File Contexts
\`\`\`bash
# Check DMS service binary label
adb shell "ls -laZ /vendor/bin/hw/vendor.dolby.hardware.dms@2.0-service"
\`\`\`

**Expected output**:
\`\`\`
-rwxr-xr-x 1 root shell u:object_r:hal_dms_default_exec:s0 ... vendor.dolby.hardware.dms@2.0-service
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                        Should be hal_dms_default_exec
\`\`\`

### 5. Check Process Context
\`\`\`bash
# Check DMS service process context
adb shell "ps -AZ | grep dms"
\`\`\`

**Expected output**:
\`\`\`
u:r:hal_dms_default:s0 ... vendor.dolby.hardware.dms@2.0-service
^^^^^^^^^^^^^^^^^^^^^^^^^^
Should be hal_dms_default domain
\`\`\`

### 6. Test DolbySound App
1. Open DolbySound app
2. Toggle should be enabled (not greyed out)
3. Audio effects should apply when enabled
4. Test with music playback

## Troubleshooting

### Issue: HAL still shows as `?` in lshal
**Possible causes**:
1. SELinux policies not applied (check file contexts)
2. Service not starting (check `logcat | grep dms`)
3. Build system integration incorrect (check device.mk/BoardConfig.mk)

**Solution**:
\`\`\`bash
# Force relabel on next boot
adb root
adb shell rm /data/.layout_version
adb reboot
\`\`\`

### Issue: SELinux denials in logcat
**Symptoms**:
\`\`\`
avc: denied { find } for service=vendor.dolby.hardware.dms@2.0::IDms/default ...
\`\`\`

**Solution**:
1. Check which domain is being denied
2. Add appropriate rule to the corresponding .te file
3. Rebuild and reflash

### Issue: DolbySound app crashes
**Check**:
\`\`\`bash
adb logcat -b crash | grep -i dolby
\`\`\`

**Possible causes**:
1. Missing Dolby libraries
2. Binder communication blocked by SELinux
3. Missing permissions in app manifest

### Issue: Build fails with "neverallow" error
**Example error**:
\`\`\`
neverallow check failed at out/target/product/.../policy/policy.conf:1234
allow hal_audio_default hwservice_manager:hwservice_manager add;
\`\`\`

**Solution**: This fix specifically addresses this by moving DMS HAL to `hal_dms_default` domain. If you still see this error:
1. Check that `hal_audio_default.te` does NOT have `add_hwservice()` for DMS
2. Ensure `hal_dms_default.te` has the `add_hwservice()` instead
3. Verify you're using the correct domain in the service RC file

## Key Differences from Android 15

### Android 15 (More Permissive)
- HALs could run in `hal_audio_default` domain
- Less strict neverallow rules
- `hal_audio_default` could register hwservices

### Android 16 (Stricter)
- HALs must run in dedicated domains
- Strict neverallow rules prevent `hal_audio_default` from registering hwservices
- **Critical**: Must use `hal_attribute_hwservice()` macro
- **Critical**: Must explicitly grant `add_hwservice()` to the HAL domain

## Android 16 Compliance Checklist

- [x] DMS HAL runs in dedicated `hal_dms_default` domain
- [x] Uses `hal_attribute_hwservice(hal_dms, hal_dms_hwservice)` macro
- [x] Grants `add_hwservice(hal_dms_default, hal_dms_hwservice)`
- [x] Proper binder communication rules with audio HAL
- [x] Proper file_contexts for service binary
- [x] Proper hwservice_contexts with version `@2.0`
- [x] App access policies (system_app, priv_app, platform_app)
- [x] Audioserver client policies
- [x] No neverallow violations

## References

- Android 16 SELinux Documentation: https://source.android.com/docs/security/features/selinux
- HAL SELinux Requirements: https://source.android.com/docs/core/architecture/hidl/selinux
- Working reference: https://github.com/tyty-android/vendor_sony_extra/tree/custom/Yodo/audio

## Testing Checklist

After flashing the ROM with this fix:

- [ ] DMS HAL shows as `I` in `lshal` (not `?`)
- [ ] No SELinux denials for Dolby in `dmesg` or `logcat`
- [ ] DolbySound app opens without crashes
- [ ] DolbySound toggle is enabled (not greyed out)
- [ ] Audio effects apply when enabled
- [ ] Audio playback works correctly with effects
- [ ] No bootloops or system crashes
- [ ] No build errors or warnings

## Success Criteria

\`\`\`bash
$ adb shell lshal | grep dolby
DM,FC I vendor.dolby.hardware.dms@2.0::IDms/default 1234 2
      ↑ "I" means success!

$ adb shell "dumpsys hwservicemanager | grep dolby"
vendor.dolby.hardware.dms@2.0::IDms/default: [hal_dms_default]

$ adb shell "dmesg | grep avc | grep dolby"
(no output = no denials = success!)

$ # DolbySound app works and audio effects apply
\`\`\`

## License
This sepolicy configuration is based on Sony's Dolby implementation and is provided as-is for use with crDroid/LineageOS builds.

## Credits
- Original implementation: Sony Mobile
- Android 16 compatibility fix: Claude Code
- Reference implementation: tyty-android
- Device: Sony Xperia 1 V (pdx234)
- ROM: crDroid 12.5 (Android 16 / LineageOS 23.0)
