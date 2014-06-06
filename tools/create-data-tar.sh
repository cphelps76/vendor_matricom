
#!/bin/bash
#set -x

. build/envsetup.sh > /dev/null
override=$1
xbmc_version=gotham
root=$(gettop)
root=$(dirname $root)
xbmcapp=
update=

function create_and_check()
{
    tar -cvf customized_data.tar data > /dev/null
    if [ -e customized_data.tar ]; then
        if [ $update == 1 ]; then
            echo "customized_data.tar created successfully"
        else
            echo "Using current customized_data.tar in vendor/matricom/prebuilt/common/data/app"
        fi
    else
        echo "customized_data.tar created unsuccessfully"
    fi
}

function diff_xbmc_sha() {
    local xbmcSHA1=$(basename `find $root/xbmc/$xbmc_version -name "xbmcapp*debug.apk"` .apk | cut -d '-' -f3)
    local prebuiltSHA1=$(basename `find vendor/matricom/prebuilt/common/data/app -name "xbmcapp*debug.apk"` .apk | cut -d '-' -f3)
    if [ "${xbmcSHA1}" != "${prebuiltSHA1}" ]; then
         xbmcapk=$(find $root/xbmc/$xbmc_version -name "xbmcapp*debug.apk")
    fi
}

# argument to override the xbmc_version
if [ ! -z $override ]; then
    xbmc_version=${override}
    xbmcapk=$(find $root/xbmc/$xbmc_version -name "xbmcapp*debug.apk")
fi

# diff the sha
if [ -d $root/xbmc/$xbmc_version ]; then
    diff_xbmc_sha
fi

# copy apk if xbmcapk defined
if [ ! -z ${xbmcapk} ]; then
    echo "Including ${xbmcapk} in customized_data.tar"
    rm vendor/matricom/prebuilt/common/data/app/xbmcapp*
    cp ${xbmcapk} vendor/matricom/prebuilt/common/data/app/
    update=1
else
    echo "${root}/xbmc/${xbmc_version} xbmcapp matches current"
    update=0
fi

# tar-tar-tar it up
cd vendor/matricom/prebuilt/common
if [ $update == 1 ]; then
    rm customized_data.tar
fi
    create_and_check
cd - > /dev/null

