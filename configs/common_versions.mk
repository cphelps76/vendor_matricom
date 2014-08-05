# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

# Firmware versioning
PRODUCT_VERSION_MAJOR := 1
PRODUCT_VERSION_MINOR := 2
PRODUCT_VERSION_BETA  := 0
PRODUCT_VERSION_DEBUG := 1

ifeq ($(TARGET_BUILD_VARIANT),user)
    # User is VENDOR, BETA, or FULL
    ifeq ($(findstring matricom,$(TARGET_PRODUCT)),)
        # Vendor build - appended with date for differentiation
        BUILD_TYPE=vendor
        BUILD_NUMBER=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date -u +%Y%m%d)
    else
        ifeq ($(PRODUCT_VERSION_BETA),0)
            BUILD_TYPE=stable
            BUILD_NUMBER=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
        else
            BUILD_TYPE=beta
            BUILD_NUMBER=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_BETA)
        endif
    endif
else
    # Debug build
    BUILD_TYPE=debug
    BUILD_NUMBER=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_BETA).$(PRODUCT_VERSION_DEBUG)
endif

# Store firmware revision in build.prop
PRODUCT_PROPERTY_OVERRIDES += ro.matricom.firmware.version=$(BUILD_NUMBER)
