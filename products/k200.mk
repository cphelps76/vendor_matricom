# Inherit vendor first, if any
ifneq ($(VENDOR_OVERLAY),)
-include vendor/matricom/configs/$(VENDOR_OVERLAY).mk
endif

# Inherit AOSP device configuration for k200
$(call inherit-product, device/amlogic/k200/full_k200.mk)

# Stable Firmware revision for device
DEVICE_FIRMWARE_VERSION=0.0.1

# Inherit common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_NAME := matricom_k200
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := k200
PRODUCT_MODEL := Matricom G-Box Q

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='G-Box Q' \
    PRODUCT_DEVICE=Q

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=Q
