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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

BOARD_VENDOR := motorola-qcom

# Falcon specific items
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_USES_MOTOROLA_LOG := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0 zcache androidboot.selinux=permissive
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000

-include device/qcom/msm8226/BoardConfig.mk

# inherit from the proprietary version
-include vendor/motorola/xt1034/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/falcon

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/motorola/falcon/init/init_falcon.c

# Custom relese tools for unified devices
TARGET_RELEASETOOLS_EXTENSIONS := device/motorola/falcon

# Assert
TARGET_OTA_ASSERT_DEVICE := xt1031,xt1032,xt1033,xt1034,falcon_umts,falcon_umtsds,falcon_cdma,falcon_retuaws,falcon

# Audio
BOARD_USES_CUSTOM_AUDIO_PLATFORM_PATH := device/motorola/falcon/audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Display
TARGET_USES_C2D_COMPOSITION := true

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Wifi related defines
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/fstab.qcom

# userdata 8GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 8589934592


# SELinux
BOARD_SEPOLICY_DIRS += \
	device/motorola/falcon/sepolicy

BOARD_SEPOLICY_UNION += \
    fs_use
