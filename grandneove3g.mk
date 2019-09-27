# Copyright (C) 2017 The Lineage Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/grandneove3g

# Inherit from vendor tree
$(call inherit-product, vendor/samsung/grandneove3g/grandneove3g-vendor.mk)

# Audio
PRODUCT_PACKAGES += \
	audio_hw.xml \
	audio_para \
	audio_effects_vendor.conf \
	audio_policy.conf \
	codec_pga.xml \
	tiny_hw.xml \
	audio.primary.sc8830 \
	libaudio-resampler

# Android Go
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=false

$(call inherit-product, build/target/product/go_defaults_512.mk)

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.image-dex2oat-filter=quicken \
	dalvik.vm.dex2oat-filter=quicken \
	pm.dexopt.first-boot=quicken \
	pm.dexopt.boot=verify \
	pm.dexopt.install=verify \
	pm.dexopt.bg-dexopt=quicken \
	pm.dexopt.ab-ota=quicken \
	pm.dexopt.inactive=verify \
	pm.dexopt.shared=quicken

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni \
	bluetooth.default \
	libbt-vendor

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480


# Codecs
PRODUCT_PACKAGES += \
	libcolorformat_switcher \
	libstagefrighthw \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec


# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Disable mobile data on first boot
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.mobiledata=false

# Disable treble OMX
PRODUCT_PROPERTY_OVERRIDES += \
	persist.media.treble_omx=false


# Enable Google-specific location features,
# Like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# For userdebug builds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb


# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayout/ist30xx_ts_input.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ist30xx_ts_input.kl \
	$(LOCAL_PATH)/keylayout/samsung-keypad.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/samsung-keypad.kl \
	$(LOCAL_PATH)/keylayout/sci-keypad.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sci-keypad.kl

# Media config
PRODUCT_PACKAGES += \
	media_codecs.xml \
	media_profiles_V1_0.xml

PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true

MEDIA_XML_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_XML_CONFIGS),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f)))

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/etc/init/android.hardware.media.omx@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.media.omx@1.0-service.rc \
	$(LOCAL_PATH)/system/etc/init/mediaserver.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/mediaserver.rc

# Camera
PRODUCT_PACKAGES += \
	camera.sc8830

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	librilutils \
	libril_shim \
	libgps_shim \
	libphoneserver_shim

# GPS
PRODUCT_PACKAGES += \
	libgpspc \
	libefuse \
	gps.conf \
	gps.xml

# HIDL (HAL Interface Definition Language)
include $(LOCAL_PATH)/hidl.mk

# HWC
PRODUCT_PACKAGES += \
	libHWCUtils \
	gralloc.sc8830 \
	libmemoryheapion \
	libion_sprd

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# Packages
PRODUCT_PACKAGES += \
	Jelly

# Performance
PRODUCT_PROPERTY_OVERRIDES += \
	sys.use_fifo_ui=1

# Permissions
PERMISSIONS_XML_FILES := \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.software.midi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSIONS_XML_FILES),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $(f)))

# RIL
PRODUCT_PACKAGES += \
	libatchannel \
	libsecril-client \
	libsecril-shim \
	libril \
	rild \
	modemd \
	modem_control

PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.modemtype=w \
	rild.libpath=/system/vendor/lib/libsecril-shim.so

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/etc/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.rc
# Rootdir
PRODUCT_PACKAGES += \
        fstab.sc8830 \
	init.board.rc \
	init.wifi.rc \
	init.sc8830.rc \
	init.sc8830.usb.rc \
	ueventd.sc8830.rc

# Disable sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.sdcardfs=false

# Seccomp
PRODUCT_COPY_FILES += \
	device/samsung/grandneove3g/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Sensors
PRODUCT_PACKAGES += \
	sensors.sc8830

# System init.rc files
PRODUCT_PACKAGES += \
	at_distributor.rc \
	chown_service.rc \
	data.rc \
	dns.rc \
	engpc.rc \
	gpsd.rc \
	kill_phone.rc \
	macloader.rc \
	modem_control.rc \
	modemd.rc \
	nvitemd.rc \
	phoneserver.rc \
	refnotify.rc \
	set_mac.rc \
	smd_symlink.rc \
	swap.rc \
	wpa_supplicant.rc

# WiFi
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_grandneove3g
PRODUCT_DEVICE := grandneove3g
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9060I
