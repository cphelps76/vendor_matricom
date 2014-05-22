# Inherit AOSP device configuration for g18
$(call inherit-product, device/amlogic/g18/full_g18.mk)

# Inherit common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

# Vendor wants full firmware
VENDOR_WANTS_ALL := true

DEVICE_PACKAGE_OVERLAYS += vendor/matricom/overlay/movutv

# Wants them gapps
VENDOR_WANTS_GAPPS := true

# Wants SU
VENDOR_WANTS_SU := true

# No updates for you
TARGET_INCLUDE_UPDATER := false

# No initlogo
TARGET_WANTS_INITLOGO_DISABLED := true

# Wants stock android sheen animation
TARGET_WANTS_STOCK_BOOTANIMATION := true

# Custom res pack with movutv boot logo
TARGET_CUSTOM_RES_PACKAGE := vendor/matricom/prebuilt/vendor/movutv/res_pack

PRODUCT_NAME := movutv_g18
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := g18
PRODUCT_MODEL := MediaBox2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='MediaBox'

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=mx2
