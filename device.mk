#
# Copyright (C) 2022 Team Win Recovery Project
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2022-2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Crypto
MITHORIUM_INCLUDE_CRYPTO_FBE := true
MITHORIUM_INCLUDE_CRYPTO_FDE := true
MITHORIUM_LEGACY_CRYPTO := true

# Use our own fstab and flags
MITHORIUM_USES_DEVICE_SPECIFIC_FSTAB := true

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)

DEVICE_PATH := device/xiaomi/mido

# Metadata
BOARD_USES_METADATA_PARTITION := false

# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/recovery/security/miui

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Retro-fitted dynamic partitions?
ifeq ($(FOX_USE_DYNAMIC_PARTITIONS),1)
  BOARD_USES_METADATA_PARTITION := true
  BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

  PRODUCT_USE_DYNAMIC_PARTITIONS := true
  PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true
  BOARD_SUPER_PARTITION_BLOCK_DEVICES := cust system
  BOARD_SUPER_PARTITION_METADATA_DEVICE := system
  BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 872415232
  BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
  BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) )

  BOARD_SUPER_PARTITION_GROUPS := mido_dynamic_partition
  BOARD_MIDO_DYNAMIC_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
  BOARD_MIDO_DYNAMIC_PARTITION_LIST := system system_ext product vendor odm

  TW_INCLUDE_FASTBOOTD := true

  PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

  PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

  PRODUCT_PROPERTY_OVERRIDES += \
	ro.fastbootd.available=true \
	ro.boot.dynamic_partitions=true \
	ro.boot.dynamic_partitions_retrofit=true

  # fstab stuff
  TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/fstab_files/recovery-dynamic.fstab
  PRODUCT_COPY_FILES += $(DEVICE_PATH)/recovery/fstab_files/twrp-dynamic.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
else
  TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/fstab_files/recovery.fstab
  PRODUCT_COPY_FILES += $(DEVICE_PATH)/recovery/fstab_files/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
endif
#
