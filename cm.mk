$(call inherit-product, device/motorola/falcon/full_falcon.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

TARGET_UNOFFICIAL_BUILD_ID := h2o64

PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_NAME := cm_falcon
