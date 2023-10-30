#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# OrangeFox-specific settings #

OF_DONT_PATCH_ENCRYPTED_DEVICE := 1
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_ALLOW_DISABLE_NAVBAR := 1
OF_SKIP_MULTIUSER_FOLDERS_BACKUP := 1
OF_UNBIND_SDCARD_F2FS := 1
OF_USE_GREEN_LED := 0

# default keymaster service version
OF_DEFAULT_KEYMASTER_VERSION := 3.0

# patch avb20 - some ROM recoveries try to overwrite custom recoveries
OF_PATCH_AVB20 := 1

# no additional check for MIUI props
OF_NO_ADDITIONAL_MIUI_PROPS_CHECK := 1

# dispense with the entire OTA menu
OF_DISABLE_OTA_MENU := 1

# run a process after formatting data to work-around MTP issues
OF_RUN_POST_FORMAT_PROCESS := 1

# don't spam the console with loop mount issues
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1

# retrofitted dynamic partitions?
ifeq ($(FOX_USE_DYNAMIC_PARTITIONS),1)
  OF_QUICK_BACKUP_LIST := /boot;/data;
  TW_INCLUDE_FASTBOOTD := true
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

  TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/fstab_files/recovery-dynamic.fstab
  PRODUCT_COPY_FILES += $(DEVICE_PATH)/recovery/fstab_files/twrp-dynamic.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
else
  OF_QUICK_BACKUP_LIST := /boot;/data;/system_image;/vendor_image;

  TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/fstab_files/recovery.fstab
  PRODUCT_COPY_FILES += $(DEVICE_PATH)/recovery/fstab_files/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
endif
#
