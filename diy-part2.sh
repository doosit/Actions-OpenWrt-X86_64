#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify the version number版本号里显示一个自己的名字（Doosit $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /Doosit $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#添加argon-config 使用 最新argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
rm -rf package/lean/luci-theme-argon/
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

./scripts/feeds update -a
./scripts/feeds install -a
