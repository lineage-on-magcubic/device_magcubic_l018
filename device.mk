#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Dalvik VM Configuration
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Init
PRODUCT_PACKAGES += \
    fstab.sun50iw15p1 \
    fstab.sun50iw15p1.vendor_ramdisk \
    init.modules.rc \
    init.power.rc \
    init.sensors.rc \
    init.sun50iw15p1.rc \
    init.sun50iw15p1.usb.rc \
    ueventd.sun50iw15p1.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.sun50iw15p1.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.sun50iw15p1.rc

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Security
BOOT_SECURITY_PATCH := 2024-06-05
INIT_BOOT_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Shipping API level
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \

# Inherit the proprietary files
$(call inherit-product, vendor/magcubic/l018/l018-vendor.mk)
