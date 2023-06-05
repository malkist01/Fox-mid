#
# Copyright (C) 2022 Team Win Recovery Project
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2022-2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# enable ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/mido

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# kernel

# fussion kernel
KERNEL_DIR := $(DEVICE_PATH)/prebuilt

# prebuilt kernel
TARGET_PREBUILT_KERNEL := $(KERNEL_DIR)/Image.gz-dtb

# brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 192

# no EDL mode
TW_HAS_EDL_MODE := false

# version
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# security patch
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# default language
TW_DEFAULT_LANGUAGE := en
#
