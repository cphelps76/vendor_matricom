# Vendor wants full firmware
VENDOR_WANTS_ALL := true

DEVICE_PACKAGE_OVERLAYS += vendor/matricom/overlay/movutv

TARGET_INCLUDE_UPDATER := false
TARGET_WANTS_INITLOGO_DISABLED := true
TARGET_WANTS_STOCK_BOOTANIMATION := true
TARGET_AMLOGIC_AML_LOGO := vendor/matricom/overlay/movutv/common/movutvlogo.bmp
#TARGET_CUSTOM_BOOTLOGO := vendor/matricom/overlay/movutv/common/movutvlogo.bmp


