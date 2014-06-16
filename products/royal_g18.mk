# Product makefile for nanonation (royal)
# Defines prior to actual target inclusion

# Client wants certain packages
VENDOR_WANTS_ALL := false

# Client doesn't want flash support
VENDOR_WANTS_FLASH := false

# Client needs su
VENDOR_WANTS_SU := true

# Client doesn't want gapps
VENDOR_WANTS_GAPPS := false

# Client doesn't want XBMC
VENDOR_WANTS_XBMC := false

# Inherit client configuration files
$(call inherit-product, vendor/clients/nanonation_product.mk)

# Inherit AOSP device configuration for g18
$(call inherit-product, device/amlogic/g18/full_g18.mk)

# Inherit some common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_NAME := royal_g18
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := g18
PRODUCT_MODEL := Matricom G-Box Midnight MX2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='G-Box MX2' \
    PRODUCT_DEVICE=MX2

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=mx2
