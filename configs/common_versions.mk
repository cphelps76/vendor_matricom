# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/matricom/tools/getdate)

# Stabel Firmware Revision for device
FIRMWARE_REV=$(DEVICE_FIRMWARE_REVISION)

# Naming pneumonic controlled by FULL_FIRMWARE_BUILD and VENDOR_OVERLAY
ifneq ($(FULL_FIRMWARE_BUILD),)
    ifeq ($(VENDOR_OVERLAY),)
        # Full System OTA Firmware update
        VENDOR_FIRMWARE_VERSION=$(TARGET_PRODUCT)_$(FIRMWARE_REV)
        PRODUCT_PROPERTY_OVERRIDES += ro.matricom.version=$(VENDOR_FIRMWARE_VERSION)
    else
        # Full System OTA Firmware update for a vendor
        # Let their overlay name supercede $(TARGET_PRODUCT)
        VENDOR_FIRMWARE_VERSION=$(VENDOR_OVERLAY)_$(FIRMWARE_REV)
        PRODUCT_PROPERTY_OVERRIDES += ro.matricom.version=$(VENDOR_FIRMWARE_VERSION)
    endif
else
    # Developer testing build
    VENDOR_FIRMWARE_VERSION=$(TARGET_PRODUCT)_$(FIRMWARE_REV)_unofficial_$(DATE)
    PRODUCT_PROPERTY_OVERRIDES += ro.matricom.version=$(VENDOR_FIRMWARE_VERSION)
endif

# Store stable firmware revision in build.prop
PRODUCT_PROPERTY_OVERRIDES += ro.matricom.firmware.version=$(FIRMWARE_REV)
