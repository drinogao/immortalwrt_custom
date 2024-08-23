#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
echo "sed -i '/small/d' /etc/opkg/distfeeds.conf" >> package/base-files/files/etc/uci-defaults/14_custom-config
echo "sed -i '/kenzo/d' /etc/opkg/distfeeds.conf" >> package/base-files/files/etc/uci-defaults/14_custom-config 
echo "sed -i '/signature/d' opkg.conf" >> package/base-files/files/etc/uci-defaults/14_custom-config
echo 'echo "#option check_signature" >> /etc/opkg.conf' >> package/base-files/files/etc/uci-defaults/14_custom-config 
echo 'echo "src/gz openwrt_smpackage https://op.dllkids.xyz/packages/x86_64/" >> /etc/opkg/customfeeds.conf' >> package/base-files/files/etc/uci-defaults/14_custom-config
echo 'exit 0' >> package/base-files/files/etc/uci-defaults/14_custom-config
