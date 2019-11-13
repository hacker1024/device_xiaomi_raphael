#
# Copyright (C) 2019 Havoc-OS
# Copyright (C) 2019 RevengeOS
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/xiaomi/raphael/device.mk)

# Inherit some common Havoc stuff.
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := havoc_raphael
PRODUCT_DEVICE := raphael
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K20 Pro
PRODUCT_MANUFACTURER := Xiaomi

TARGET_BOOT_ANIMATION_RES := 1080

BUILD_FINGERPRINT := "Xiaomi/raphaelin/raphaelin:10/QKQ1.190716.003/V10.4.8.0.QFKINXM:user/release-keys"

export export
HAVOC_BUILD_TYPE=Official
PRODUCT_PROPERTY_OVERRIDES += \
    ro.havoc.maintainer=hacker1024
