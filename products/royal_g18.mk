# Inherit AOSP device configuration for g18
$(call inherit-product, device/amlogic/g18/full_g18.mk)

# Inherit some common product files
$(call inherit-product, vendor/matricom/configs/common.mk)

VENDOR_WANTS_ALL := false
FULL_FIRMWARE_BUILD := true

# Stock Applications
PRODUCT_PACKAGES += \
    Bluetooth \
    DeskClock \
    CertInstaller \
    DrmProvider \
    FusedLocation \
    Gallery2 \
    InputDevices \
    LatinIME \
    Music \
    MusicFX \
    Provision \
    QuickSearchBox \
    Settings \
    SystemUI \
    bluetooth-health \
    hostapd \
    wpa_supplicant.conf
    
# Custom Vendor Products
PRODUCT_PACKAGES += CelebrityCrewTV

DEVICE_PACKAGE_OVERLAYS += vendor/matricom/overlay/royal

# ADB required to on by default
PRODUCT_PROPERTY_OVERRIDES += persist.service.adb.enable=1

# No flash apk needed
VENDOR_WANTS_FLASH := false

# Vendor needs SU
VENDOR_WANTS_SU := true

# Vendor doesn't want gapps
VENDOR_WANTS_GAPPS := false

# Vendor doesn't want xbmc
VENDOR_WANTS_XBMC := false

PRODUCT_NAME := royal_g18
PRODUCT_BRAND := G-Box
PRODUCT_DEVICE := g18
PRODUCT_MODEL := Matricom G-Box Midnight MX2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME='G-Box MX2' \
    PRODUCT_DEVICE=MX2

PRODUCT_PROPERTY_OVERRIDES += ro.matricom.device=mx2
