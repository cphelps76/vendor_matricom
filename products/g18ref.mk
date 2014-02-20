# Inherit AOSP device configuration for g18ref
$(call inherit-product, device/amlogic/g18ref/full_g18ref.mk)

# Stable Firmware revision for device
DEVICE_FIRMWARE_REVISION=1.1.6

# Inherit common product files
#$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_NAME := matricom_g18ref
PRODUCT_BRAND := MBX
PRODUCT_DEVICE := g18ref
PRODUCT_MODEL := MBX reference board (g18ref)
PRODUCT_MANUFACTURER := MBX
