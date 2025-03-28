#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


# 移植以下机型
# rumu3f_fine-3399

echo -e "\\ndefine Device/rumu3f_fine-3399
  DEVICE_VENDOR := RUMU3F
  DEVICE_MODEL := FINE 3399
  SOC := rk3399
  UBOOT_DEVICE_NAME := fine3399-rk3399
  BOOT_FLOW := pine64-bin
  DEVICE_PACKAGES := kmod-gpio-button-hotplug kmod-r8168
endef
TARGET_DEVICES += rumu3f_fine-3399" >> target/linux/rockchip/image/armv8.mk

ls target/linux/rockchip/image
cat target/linux/rockchip/image/armv8.mk



cp -f $GITHUB_WORKSPACE/configfiles/rk3588-lemonpi-pi1.dts target/linux/rockchip/dts/rk3588

ls target/linux/rockchip/dts/rk3588

cat target/linux/rockchip/image/rk35xx.mk







cp -f $GITHUB_WORKSPACE/configfiles/fine3399-rk3399_defconfig package/boot/uboot-rockchip/src/configs/fine-3399-rk3399_defconfig




cp -f $GITHUB_WORKSPACE/configfiles/rk3399-fine-3399.dts target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399-fine-3399.dts




cp -f $GITHUB_WORKSPACE/configfiles/rk3399-fine-3399.dts package/boot/uboot-rockchip/src/arch/arm/dts/rk3399-fine-3399.dts





