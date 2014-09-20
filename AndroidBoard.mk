LOCAL_PATH := $(call mydir)

#
# Compile Linux Kernel
#
KERNEL_DEFCONFIG := msm8226_mmi_defconfig

include device/qcom/msm8226/AndroidBoard.mk

#Create symbolic links
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
        mkdir -p $(TARGET_OUT_VENDOR)/lib; \
        rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
        ln sf /persist/WCNSS_qcom_wlan_factory_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin; \
        ln sf /system/lib/libQSEEComAPI.so \
        $(TARGET_OUT_VENDOR)/lib/libQSEEComAPI.so)
