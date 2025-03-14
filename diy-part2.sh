#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

echo -e "\\ndefine Device/fine_3399
\$(call Device/rk3399)
  DEVICE_MODEL := fine-3399
  SUPPORTED_DEVICES += fine,fine-3399
  DEVICE_DTS := rk3399-fine-3399
  DEVICE_PACKAGES := kmod-nvme kmod-scsi-core kmod-hwmon-pwmfan kmod-thermal
endef
TARGET_DEVICES += fine_3399" >> target/linux/rockchip/image/rk33xx.mk


cp -f $GITHUB_WORKSPACE/configfiles/rk3399-fine-3399.dts target/linux/rockchip/dts/rk3399
ls target/linux/rockchip/dts/rk3399
cat target/linux/rockchip/image/rk33xx.mk



