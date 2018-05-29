#
# Copyright (C) 2018 The LineageOS Project
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
ifeq ($(WITH_AICP),true)

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from ph2n device
$(call inherit-product, device/lge/ph2n/device.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Set those variables here to overwrite the inherited values.
BOARD_VENDOR := lge
PRODUCT_DEVICE := ph2n
PRODUCT_NAME := aicp_ph2n
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG Stylo 2 Plus
PRODUCT_MANUFACTURER := lge

PRODUCT_GMS_CLIENTID_BASE := android-lge

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="MetroPCS/ph2n_mpcs_us/ph2n:7.1.2/NRD90U/171071514d722:user/release-keys" \
    PRIVATE_BUILD_DESC="ph2n_mpcs_us-user 7.1.2 NRD90U 171071514d722 release-keys"

endif
