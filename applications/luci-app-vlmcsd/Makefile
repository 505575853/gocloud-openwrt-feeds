# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-vlmcsd
PKG_VERSION:=1
PKG_RELEASE:=25

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-vlmcsd
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for KMS
	DEPENDS:=+vlmcsd
	PKGARCH:=all
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/po/zh-cn/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(basename $(notdir $(po))).zh-cn.lmo;)
endef

define Build/Compile
endef

define Package/luci-app-vlmcsd/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/

	find $(1) -name *.lua -exec luac -s -o {} {} \;
endef

define Package/luci-app-vlmcsd/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	( . /etc/uci-defaults/luci-app-vlmcsd ) && rm -f /etc/uci-defaults/luci-app-vlmcsd
	rm -fr /tmp/luci*
	chmod 755 /etc/init.d/vlmcsd >/dev/null 2>&1
	/etc/init.d/vlmcsd enable >/dev/null 2>&1
fi
exit 0
endef

define Package/luci-app-vlmcsd/prerm
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
     /etc/init.d/vlmcsd disable
     /etc/init.d/vlmcsd stop
fi
exit 0
endef

$(eval $(call BuildPackage,luci-app-vlmcsd))

# call BuildPackage - OpenWrt buildroot signature


