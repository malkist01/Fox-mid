#
# Copyright (C) 2022 Team Win Recovery Project
#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Crypto
MITHORIUM_INCLUDE_CRYPTO_FBE := true
MITHORIUM_INCLUDE_CRYPTO_FDE := true
MITHORIUM_LEGACY_CRYPTO := true

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)

# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/recovery/security/miui

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
