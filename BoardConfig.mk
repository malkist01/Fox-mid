#
# Copyright (C) 2022 Team Win Recovery Project
#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# use our own fstab+flags
MITHORIUM_USES_DEVICE_SPECIFIC_FSTAB := true

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/mido

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

# no EDL mode
TW_HAS_EDL_MODE := false

# brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 145

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
#
