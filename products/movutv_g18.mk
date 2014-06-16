# Product makefile for movutv
# Defines prior to actual target inclusion

# Client wants full firmware
VENDOR_WANTS_ALL := true

# Client wants gapps
VENDOR_WANTS_GAPPS := true

# Client wants SU
VENDOR_WANTS_SU := true

# Updater not included
TARGET_INCLUDE_UPDATER := false

# Initlogo disabled
TARGET_WANTS_INITLOGO_DISABLED := true

# Client wants stock bootanimation
TARGET_WANTS_STOCK_BOOTANIMATION := true


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
