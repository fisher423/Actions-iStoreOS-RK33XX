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








# 复制和修改u-boot压缩包SHA256校验码，编译失败时注意看是不是这个引起的。
cp -f $GITHUB_WORKSPACE/configfiles/uboot_Makefile package/boot/uboot-rockchip/Makefile
cp -f $GITHUB_WORKSPACE/configfiles/u-boot.mk include/u-boot.mk
sha256_value=$(wget -qO- "https://github.com/fisher423/file/releases/download/u-boot-2021.07/u-boot-2021.07.tar.bz2.sha" | awk '{print $1}')
if [ -n "$sha256_value" ]; then
sed -i "s/.*PKG_HASH:=.*/PKG_HASH:=$sha256_value/g" package/boot/uboot-rockchip/Makefile
fi



# 复制defconfig配置文件到u-boot目录里面
cp -f $GITHUB_WORKSPACE/configfiles/r08-rk3399_defconfig package/boot/uboot-rockchip/src/configs/r08-rk3399_defconfig
cp -f $GITHUB_WORKSPACE/configfiles/fine3399-rk3399_defconfig package/boot/uboot-rockchip/src/configs/fine-3399-rk3399_defconfig
cp -f $GITHUB_WORKSPACE/configfiles/tpm312-rk3399_defconfig package/boot/uboot-rockchip/src/configs/tpm312-rk3399_defconfig



# 复制对应的dts设备树文件到指定目录和u-boot目录里面
cp -f $GITHUB_WORKSPACE/configfiles/rk3399.dtsi target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399.dtsi
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-opp.dtsi target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-op1-opp.dtsi target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-r08.dts target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399-r08.dts
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-fine-3399.dts target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399-fine-3399.dts
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-tpm312.dts target/linux/rockchip/armv8/files/arch/arm64/boot/dts/rockchip/rk3399-tpm312.dts


cp -f $GITHUB_WORKSPACE/configfiles/rk3399.dtsi package/boot/uboot-rockchip/src/arch/arm/dts/rk3399.dtsi
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-opp.dtsi package/boot/uboot-rockchip/src/arch/arm/dts/rk3399-opp.dtsi
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-op1-opp.dtsi package/boot/uboot-rockchip/src/arch/arm/dts/rk3399-op1-opp.dtsi
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-r08.dts package/boot/uboot-rockchip/src/arch/arm/dts/rk3399-r08.dts
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-fine-3399.dts package/boot/uboot-rockchip/src/arch/arm/dts/rk3399-fine-3399.dts
cp -f $GITHUB_WORKSPACE/configfiles/rk3399-tpm312.dts package/boot/uboot-rockchip/src/arch/arm/dts/rk3399-tpm312.dts



# 不开启无线功能，已移除Realtek相关无线驱动，这个暂时不可用，原因兼容性不好，会异常掉线
# cp -f $GITHUB_WORKSPACE/configfiles/opwifi package/base-files/files/etc/init.d/opwifi
# chmod 755 package/base-files/files/etc/init.d/opwifi
# sed -i "s/wireless.radio\${devidx}.disabled=1/wireless.radio\${devidx}.disabled=0/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh


# 集成CPU性能跑分脚本
cp -a $GITHUB_WORKSPACE/configfiles/coremark/* package/base-files/files/bin/
chmod 755 package/base-files/files/bin/coremark
chmod 755 package/base-files/files/bin/coremark.sh

# 定时限速插件
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
