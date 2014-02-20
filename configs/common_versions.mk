# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/matricom/tools/getdate)

# Firmware Revision for device
FIRMWARE_REV=$(DEVICE_FIRMWARE_REVISION)

ifneq ($(FULL_FIRMWARE_BUILD),)
    # Full System OTA Firmware update
    PRODUCT_PROPERTY_OVERRIDES += \       
        ro.matricom.version=$(TARGET_PRODUCT)_$(FIRMWARE_REV)
else
ifneq ($(MATRICOM_DELTA),)
        # OTA Nightly using OpenDelta
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.matricom.version=$(TARGET_PRODUCT)_$(FIRMWARE_REV)_$(DATE)
else
        # Developer testing build
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.matricom.version=$(TARGET_PRODUCT)_$(FIRMWARE_REV)_unofficial_$(DATE)
endif
endif