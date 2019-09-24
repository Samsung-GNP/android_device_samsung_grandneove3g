# Release name
PRODUCT_RELEASE_NAME := grandneove3g

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/grandneove3g.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := grandneove3g
PRODUCT_NAME := lineage_grandneove3g
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I9060I
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

# Stock build fingerprint
BUILD_FINGERPRINT := "samsung/core33gdd/core33g:4.4.4/KTU84P/G360HDDU0APA3:user/release-keys"
PRIVATE_BUILD_DESC := "core33gdd-user 4.4.4 KTU84P G360HDDU0APA3 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.fingerprint=$(BUILD_FINGERPRINT)
