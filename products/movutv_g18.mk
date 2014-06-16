# Inherit client configuration files
$(call inherit-product, vendor/clients/movutv_product.mk)

# Inherit AOSP device configuration for g18
$(call inherit-product, device/amlogic/g18/full_g18.mk)

# Inherit common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_NAME := movutv_g18
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := g18
PRODUCT_MODEL := MediaBox2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='MediaBox'

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=mx2
