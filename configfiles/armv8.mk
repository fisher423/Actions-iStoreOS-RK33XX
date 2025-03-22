# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Sarah Maedel


define Device/rk3399_fine3399
  DEVICE_VENDOR := RK3399
  DEVICE_MODEL := FINE3399
  SOC := rk3399
  SUPPORTED_DEVICES := rk3399,fine3399
  UBOOT_DEVICE_NAME := fine3399-rk3399
  BOOT_FLOW := pine64-bin
  DEVICE_PACKAGES := kmod-gpio-button-hotplug kmod-r8168
endef
TARGET_DEVICES += rk3399_fine3399
