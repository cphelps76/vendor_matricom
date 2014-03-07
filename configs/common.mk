# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/matricom/overlay/common

# Common packages
PRODUCT_PACKAGES += \
    AirPlay \
    DLNA \
    RC_Server \
    Updater

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
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfs-3g

# Busybox
ifneq ($(filter userdebug, $(TARGET_BUILD_VARIANT)),)
PRODUCT_PACKAGES += \
    busybox \
    utility_busybox

endif

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

ifeq ($(TARGET_WANTS_DVBPLAYER),true)
-include vendor/matricom/configs/dvbplayer.mk
endif


# Inherit common build.prop overrides
-include vendor/matricom/configs/common_versions.mk

# common boot animation
PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
