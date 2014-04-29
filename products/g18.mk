# Inherit vendor first, if any
ifneq ($(VENDOR_OVERLAY),)
-include vendor/matricom/configs/$(VENDOR_OVERLAY).mk
endif

# Inherit AOSP device configuration for g18
$(call inherit-product, device/amlogic/g18/full_g18.mk)

# Inherit common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

PRODUCT_NAME := matricom_g18
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := g18
ifneq ($(PRODUCT_MODEL_OVERRIDE),)
PRODUCT_MODEL := $(PRODUCT_MODEL_OVERRIDE)
else
PRODUCT_MODEL := Matricom G-Box Midnight MX2
endif

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='G-Box MX2' \
    PRODUCT_DEVICE=MX2

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=mx2
