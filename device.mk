#
# Copyright (C) 2016 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/ph2n/ph2n-vendor.mk)

# common msm8937
$(call inherit-product, device/lge/sd4xx-common/sd4xx.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

# HWADDRS
PRODUCT_PACKAGES += \
    hwaddrs

# Ramdisk
PRODUCT_PACKAGES += \
    init.variant.rc

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp-lg.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-lg.conf \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:$(TARGET_COPY_OUT_VENDOR)/etc/nfcee_access.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    nfc_nci.pn54x.default \
    com.android.nfc_extras

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_common.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_common.conf \
    $(LOCAL_PATH)/configs/sensors/sensor_def_variable.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_variable.conf

# Thermal Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal-engine-8937.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-8937.conf

# WCNSS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_boot.bin
