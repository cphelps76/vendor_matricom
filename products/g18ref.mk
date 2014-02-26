# Inherit AOSP device configuration for g18ref
$(call inherit-product, device/amlogic/g18ref/full_g18ref.mk)

# Stable Firmware revision for device
DEVICE_FIRMWARE_REVISION=1.1.7S

# Inherit common product files
#$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_NAME := matricom_g18ref
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := g18ref
PRODUCT_MODEL := Matricom G-Box Midnight MX2
PRODUCT_MANUFACTURER := MBX


PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='G-Box MX2' \
    PRODUCT_DEVICE=MX2
