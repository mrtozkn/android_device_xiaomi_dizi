#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Is tablet
TARGET_IS_TABLET := true

# Use prebuilt kernel
TARGET_USE_PREBUILT_KERNEL := true

# Inherit from sm7435-ab-common (doesnt exist)
# $(call inherit-product, device/xiaomi/sm8250-common/kona.mk)

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

# PRODUCT_PACKAGES += \ Bakılacak
#    vendor.xiaomi_elish.peripherals@1.0-service.default

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

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel

# Wlan fix for stock kernel - Bakılacak 
ifeq ($(TARGET_USE_PREBUILT_KERNEL),true)
PRODUCT_PACKAGES += \
    firmware_qca6390_WCNSS_qcom_cfg.ini_symlink \
    firmware_qca6390_wlan_mac.bin_symlink
endif

# Inherit from vendor blobs - Bakılacak
# $(call inherit-product, vendor/xiaomi/elish/elish-vendor.mk)
