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
VENDOR_WANTS_SILENT_SU := true
