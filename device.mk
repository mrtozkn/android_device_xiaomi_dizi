#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Product characteristics
PRODUCT_CHARACTERISTICS := tablet

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Use prebuilt kernel
TARGET_USE_PREBUILT_KERNEL := true

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600

# Camera
PRODUCT_PACKAGES += \
    libMegviiFacepp-0.5.2 \
    libmegface \
    libpiex_shim

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \
    vendor.xiaomi.hardware.fx.tunnel@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor

# Parts
PRODUCT_PACKAGES += \
    MiPadParts

#Peripherals
PRODUCT_PACKAGES += \
    vendor.xiaomi_dizi.peripherals@1.0

# Remove unused packages
PRODUCT_PACKAGES += \
    RemovePackages

# Rootdir
PRODUCT_PACKAGES += \
    bluedut.sh \
    bt_close.sh \
    check_fatal_err.sh \
    init.class_main.sh \
    init.crda.sh \
    init.kernel.post_boot-parrot.sh \
    init.kernel.post_boot-ravelin.sh \
    init.kernel.post_boot.sh \
    init.mdm.sh \
    init.mi.serial.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.display_boot.sh \
    init.qti.kernel.debug-parrot.sh \
    init.qti.kernel.debug-ravelin.sh \
    init.qti.kernel.debug.sh \
    init.qti.kernel.early_debug-parrot.sh \
    init.qti.kernel.early_debug.sh \
    init.qti.kernel.sh \
    init.qti.media.sh \
    init.qti.qcv.sh \
    init.qti.touch_boot.sh \
    init.qti.write.sh \
    myftm.agent.sh \
    qca6234-service.sh \
    vendor_modprobe.sh \
    wifitest.sh \
    wifitest_close.sh \

PRODUCT_PACKAGES += \
    fstab.default \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.kernel.rc \
    init.qti.ufs.rc \
    init.target.rc \
    init.recovery.hardware.rc \
    init.recovery.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.default:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.default

# RRO Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayDizi \
    FrameworkResOverlayDizi \
    LineageSDKOverlayDizi \
    NetworkStackOverlayMIUI \
    SettingsOverlayDizi \
    SettingsProviderOverlayDizi \
    SystemUIOverlayDizi

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/xiaomi \
    hardware/qcom-caf/common \
    hardware/qcom-caf/wlan

# Wlan fix for stock kernel - Bakılacak 
ifeq ($(TARGET_USE_PREBUILT_KERNEL),true)
PRODUCT_PACKAGES += \
    firmware_qca6390_WCNSS_qcom_cfg.ini_symlink \
    firmware_qca6390_wlan_mac.bin_symlink
endif

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/dizi/dizi-vendor.mk)
