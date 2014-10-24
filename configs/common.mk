# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/matricom/overlay/common

# Common packages
PRODUCT_PACKAGES += \
    RemoteIME

# Updater
ifneq ($(TARGET_INCLUDE_UPDATER),false)
PRODUCT_PACKAGES += Updater
endif

ifneq ($(VENDOR_WANTS_ALL),false)
PRODUCT_PACKAGES += \
    Launcher3 \
    G-BoxLauncher \
    MatriWizard \
    libGoogleAnalyticsV2
endif

# Xbmc inclusion determined in makefile
-include vendor/matricom-priv/kodi/kodi.mk

# Input Device Configurations
PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/common/usr/idc/Vendor_05e3_Product_0610.idc:system/usr/idc/Vendor_05e3_Product_0610.idc \
    vendor/matricom/prebuilt/common/usr/idc/Vendor_2149_Product_2306.idc:system/usr/idc/Vendor_2149_Product_2306.idc

# Controller support
PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/common/usr/keylayout/Vendor_045e_Product_0291.kl:system/usr/keylayout/Vendor_045e_Product_0291.kl \
    vendor/matricom/prebuilt/common/usr/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    ro.kernel.android.checkjni=0

# selinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/matricom/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/matricom/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/matricom/prebuilt/common/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# fs utils
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# moar powah
PRODUCT_PACKAGES += \
    sqlite3

# Busybox
PRODUCT_PACKAGES += \
    busybox \
    utility_busybox

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

ifneq ($(TARGET_WANTS_STOCK_BOOTANIMATION),true)
# common boot animation
PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

# Inherit common build.prop overrides
-include vendor/matricom/configs/common_versions.mk

ifeq ($(PLATFORM_VERSION_CODENAME),UNOFFICIAL)
$(call inherit-product-if-exists, vendor/google/add-google-apps.mk)
endif

# Root
ifeq ($(PLATFORM_VERSION_CODENAME),UNOFFICIAL)
-include vendor/matricom-priv/su/superuser.mk
endif

# Include key determinate
-include vendor/matricom-priv/security/keys.mk

# For Google TV remote functionality
-include vendor/matricom-priv/anymote/anymote.mk
