LOCAL_PATH := $(call my-dir)

# include the non-open-source counterpart to this file
-include vendor/motorola/xt1034/AndroidBoardVendor.mk

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
KERNEL_DEFCONFIG := msm8226_caf_defconfig

#----------------------------------------------------------------------
# Copy additional target-specific files
#----------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE       := init.mmi.boot.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.mmi.boot.sh
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.mmi.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.mmi.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.mmi.touch.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.mmi.touch.sh
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := thermal-engine-8226.conf
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := thermal-engine-8226.conf
include $(BUILD_PREBUILT)

-include device/qcom/msm8226/AndroidBoard.mk

#Create symbolic links
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
        mkdir -p $(TARGET_OUT_VENDOR)/lib; \
        rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
        ln -sf /persist/WCNSS_qcom_wlan_factory_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin; \
        ln -sf /system/lib/libQSEEComAPI.so \
        $(TARGET_OUT_VENDOR)/lib/libQSEEComAPI.so)
