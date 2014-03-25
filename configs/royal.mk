VENDOR_WANTS_ALL := false

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
#PRODUCT_PACKAGES += \
#    CelebrityCrewTV

# ADB required to on by default
PRODUCT_PROPERTY_OVERRIDES += persist.service.adb.enable=1

# No flash apk needed
VENDOR_WANTS_FLASH := false

# Vendor utilizes SU for launcher (i know...)
VENDOR_WANTS_SU := true
PRODUCT_PACKAGES += su Superuser
PRODUCT_PROPERTY_OVERRIDES += persist.sys.root.access=3
