#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml

$(call inherit-product, device/qcom/msm8226/msm8226.mk)

LOCAL_PATH := device/motorola/falcon

# xt1053 specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# HAL
PRODUCT_PACKAGES += \
    gps.msm8226 \
    keystore.qcom \
    lights.MSM8226

# Misc
PRODUCT_PACKAGES += \
    Launcher3 \
    libemoji

# Ramdisk
PRODUCT_PACKAGES += \
    init.mmi.boot.sh \
    init.mmi.rc \
    init.mmi.touch.sh \
    thermal-engine-8226.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/init.target.rc:root/init.target.rc \
    $(LOCAL_PATH)/mount_pds.sh:system/bin/mount_pds.sh \
    $(LOCAL_PATH)/ueventd.qcom.rc:root/ueventd.qcom.rc \

# Gps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps.conf:system/etc/gps.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# World APN list
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/apns-conf.xml:system/etc/apns-conf.xml

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.handset.mic=digital

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.fm_max_volume=4096 \
    ro.qualcomm.cabl=0 \

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.mtp=0x2e82 \
    ro.usb.mtp_adb=0x2e76 \
    ro.usb.ptp=0x2e83 \
    ro.usb.ptp_adb=0x2e84 \
    ro.usb.bpt=0x2e28 \
    ro.usb.bpt_adb=0x2e29 \
    ro.usb.bpteth=0x2e2a \
    ro.usb.bpteth_adb=0x2e2b \
    persist.gps.qc_nlp_in_use=0 \
    qcom.bt.le_dev_pwr_class=1 \
    ro.sf.lcd_density=320 \
    persist.sys.usb.config=mtp,adb \
    ro.crypto.fuse_sdcard=true

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.call_type=1 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.dfr_mode_set=1 \
    persist.sys.ssr.restart_level=3 \
    persist.sys.qc.sub.rdump.on=1 \
    ro.config.vc_call_vol_steps=7 \
    ro.use_data_netmgrd=true

$(call inherit-product, vendor/motorola/xt1034/xt1034-vendor.mk)
