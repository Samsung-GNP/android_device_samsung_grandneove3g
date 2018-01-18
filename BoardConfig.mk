# Copyright (C) 2017 The Lineage Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Device board elements
include device/samsung/grandneove3g/PlatformConfig.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := GT-I9060I,grandneove3g

# Audio
BOARD_USES_TINYALSA_AUDIO := true
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Bluetooth
USE_BLUETOOTH_BCM4343 := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/grandneove3g/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/grandneove3g/bluetooth/libbt_vndcfg.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sc7730s
TARGET_NO_BOOTLOADER := true

# Build system
WITHOUT_CHECK_API := true

# Camera
TARGET_CAMERA_OPEN_SOURCE := true
CAMERA_SUPPORT_SIZE := 5M
FRONT_CAMERA_SUPPORT_SIZE := 2M
TARGET_BOARD_BACK_CAMERA_INTERFACE := ccir
TARGET_BOARD_BACK_CAMERA_MIPI := phyab
TARGET_BOARD_CAMERA_CAPTURE_MODE := false
TARGET_BOARD_CAMERA_FACE_DETECT := false
TARGET_BOARD_CAMERA_HAL_VERSION := HAL1.0
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false
TARGET_BOARD_CAMERA_FLASH_CTRL := false
TARGET_BOARD_FRONT_CAMERA_INTERFACE := ccir
TARGET_BOARD_FRONT_CAMERA_MIPI := phyb
TARGET_BOARD_NO_FRONT_SENSOR := false
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Dexpreopt
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
PRODUCT_DEX_PREOPT_BOOT_FLAGS += --compiler-filter=speed
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed
WITH_DEX_PREOPT_GENERATE_PROFILE := false

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# GPS
TARGET_SPECIFIC_HEADER_PATH := device/samsung/grandneove3g/include

# Graphics
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
BOARD_USES_SPRD_HARDWARE := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
USE_SPRD_DITHER := true
USE_SPRD_HWCOMPOSER := true
USE_OPENGL_RENDERER := true

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# HIDL
DEVICE_MANIFEST_FILE := device/samsung/grandneove3g/configs/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec

# Kernel
TARGET_KERNEL_CONFIG := grandneove3g_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/grandneove3g
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/grandneove3g/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x01d88000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin

# Lights
TARGET_HAS_BACKLIT_KEYS := false

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6094323712
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# PowerHAL
TARGET_POWERHAL_VARIANT := scx35

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/grandneove3g/rootdir/fstab.sc8830

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD__CLASS := ../../../device/samsung/grandneove3g/
TARGET_DISABLE_ASHMEM_TRACKING := true

# Seccomp
BOARD_SECCOMP_POLICY := device/samsung/grandneove3g/seccomp

# Sensors
TARGET_USES_SENSORS_WRAPPER := true

# Shims
TARGET_LD_SHIM_LIBS += \
	/system/vendor/lib/hw/camera.sc8830.so|libmemoryheapion.so \
	/system/vendor/bin/gpsd|libgps_shim.so

# SELinux policy
#BOARD_SEPOLICY_DIRS += device/samsung/grandneove3g/sepolicy

# System properties
TARGET_SYSTEM_PROP += device/samsung/grandneove3g/system.prop

# Vendor platform
BOARD_VENDOR := samsung

# WiFi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4343
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/vendor/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

# Inherit from the proprietary version
include vendor/samsung/grandneove3g/BoardConfigVendor.mk
