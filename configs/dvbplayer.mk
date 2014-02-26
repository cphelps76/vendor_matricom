PRODUCT_PACKAGES += \
    bookplay_package \
    DVBPlayer \ 
    DVBService \
    progmanager  

PRODUCT_COPY_FILES += \
    vendor/matricom/prebuilt/DVBPlayer/lib/libam_adp.so:system/lib/libam_adp.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libam_mw.so:system/lib/libam_mw.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjniamsmc.so:system/lib/libjniamsmc.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidmx.so:system/lib/libjnidmx.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidsc.so:system/lib/libjnidsc.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbclientsubtitle.so:system/lib/libjnidvbclientsubtitle.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbdatabase.so:system/lib/libjnidvbdatabase.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbepgscanner.so:system/lib/libjnidvbepgscanner.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbfrontendctrl.so:system/lib/libjnidvbfrontendctrl.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbplayer.so:system/lib/libjnidvbplayer.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbrecorder.so:system/lib/libjnidvbrecorder.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvbscanner.so:system/lib/libjnidvbscanner.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnidvr.so:system/lib/libjnidvr.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnifilter.so:system/lib/libjnifilter.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjnifrontend.so:system/lib/libjnifrontend.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libjniosd.so:system/lib/libjniosd.so \
    vendor/matricom/prebuilt/DVBPlayer/lib/libzvbi.so:system/lib/libzvbi.so
