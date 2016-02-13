#
# Copyright 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel Prebuilt
BOARD_CUSTOM_BOOTIMG_MK := device/motorola/falcon/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.bootdevice=msm_sdcc.1 androidboot.hardware=qcom vmalloc=400M androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_CONFIG := falcon_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/msm8226

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1023410176
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5930614784
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP
BOARD_HAS_NO_REAL_SDCARD := true
DEVICE_RESOLUTION := 720x1280
HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_EXCLUDE_SUPERSU := true
TW_IGNORE_MAJOR_AXIS_0 := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_L_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_NO_SCREEN_BLANK := true
TW_NO_USB_STORAGE := true
TW_TARGET_USES_QCOM_BSP := true
TW_THEME := portrait_hdpi
