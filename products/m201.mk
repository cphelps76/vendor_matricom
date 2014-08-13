# Inherit AOSP device configuration for m201
$(call inherit-product, device/amlogic/m201/full_m201.mk)

# Inherit common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/matricom/overlay/m201

PRODUCT_NAME := matricom_m201
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := m201
PRODUCT_MODEL := Matricom G-Box MX4

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='G-Box MX4' \
    PRODUCT_DEVICE=MX4

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=mx4
