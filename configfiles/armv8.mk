# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Sarah Maedel


define Device/rockchip_rk3308_evb
  DEVICE_VENDOR := Rochckip
  DEVICE_MODEL := RK3308 EVB
  SOC := rk3308
  UBOOT_DEVICE_NAME := evb-rk3308
  IMAGE/sysupgrade.img.gz := boot-common | boot-script rk3308 | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152 ethtool
endef
TARGET_DEVICES += rockchip_rk3308_evb

define Device/rumu3f_fine-3399
  DEVICE_VENDOR := RUMU3F
  DEVICE_MODEL := FINE-3399
  SOC := rk3399
  UBOOT_DEVICE_NAME := fine-3399-rk3399
  BOOT_FLOW := pine64-bin
  DEVICE_PACKAGES := kmod-gpio-button-hotplug kmod-r8168
endef
TARGET_DEVICES += rumu3f_fine-3399
