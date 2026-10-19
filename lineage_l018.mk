#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common AOSP stuff
$(call inherit-product, device/google/atv/products/atv_base.mk)
$(call inherit-product, device/google/atv/products/atv_lowram_defaults.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, device/magcubic/device.mk)

PRODUCT_NAME := lineage_l018
PRODUCT_DEVICE := l018
PRODUCT_MANUFACTURER := Magcubic
PRODUCT_BRAND := Magcubic
PRODUCT_MODEL := L018

PRODUCT_CHARACTERISTICS := tv
PRODUCT_GMS_CLIENTID_BASE := android-allwinner
