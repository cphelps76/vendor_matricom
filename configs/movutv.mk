# Vendor wants full firmware
VENDOR_WANTS_ALL := true

DEVICE_PACKAGE_OVERLAYS += vendor/matricom/overlay/movutv

TARGET_INCLUDE_UPDATER := false
TARGET_WANTS_INITLOGO_DISABLED := true
TARGET_WANTS_STOCK_BOOTANIMATION := true
TARGET_CUSTOM_RES_PACKAGE := vendor/matricom/prebuilt/vendor/movutv/res_pack


