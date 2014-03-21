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
PRODUCT_PACKAGES += \
    CelebrityCrewTV

PRODUCT_PROPERTY_OVERRIDES += persist.service.adb.enable=1

VENDOR_WANTS_FLASH := false

