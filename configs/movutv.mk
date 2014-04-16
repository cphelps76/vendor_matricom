# Vendor wants full firmware
VENDOR_WANTS_ALL := true

DEVICE_PACKAGE_OVERLAYS += vendor/matricom/overlay/movutv

# Override product model
PRODUCT_MODEL_OVERRIDE := MediaBox

# Wants them gapps
VENDOR_WANTS_GAPPS := true
# Wants SU
VENDOR_WANTS_SU := true
# No updates for you
TARGET_INCLUDE_UPDATER := false
# No initlogo
TARGET_WANTS_INITLOGO_DISABLED := true
# Wants stock android sheen animation
TARGET_WANTS_STOCK_BOOTANIMATION := true
# Custom res pack with movutv boot logo
TARGET_CUSTOM_RES_PACKAGE := vendor/matricom/prebuilt/vendor/movutv/res_pack


