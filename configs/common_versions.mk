# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

# Firmware versioning
PRODUCT_VERSION_MAJOR := 0
PRODUCT_VERSION_MINOR := 0
PRODUCT_VERSION_BETA  := 0
PRODUCT_VERSION_DEBUG := 9

ifeq ($(TARGET_BUILD_VARIANT),user)
    # User is VENDOR, BETA, or FULL
    ifeq ($(findstring matricom,$(TARGET_PRODUCT)),)
        # Vendor build - appended with date for differentiation
        FIRMWARE_REVISION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)
    else
        ifeq ($(PRODUCT_VERSION_BETA),0)
            FIRMWARE_REVISION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
        else
            FIRMWARE_REVISION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_BETA)
        endif
    endif
else
    # Debug build
    FIRMWARE_REVISION=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_BETA).$(PRODUCT_VERSION_DEBUG)
endif

# Store firmware revision in build.prop
PRODUCT_PROPERTY_OVERRIDES += ro.matricom.firmware.version=$(FIRMWARE_REVISION)
