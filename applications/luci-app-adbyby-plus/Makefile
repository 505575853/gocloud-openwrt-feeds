
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-adbyby-plus
PKG_VERSION:=3
PKG_RELEASE:=15

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-adbyby-plus
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for ADBYBY
	DEPENDS:=+adbyby +wget +ipset +coreutils +coreutils-nohup
	PKGARCH:=all
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/po/zh-cn/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(basename $(notdir $(po))).zh-cn.lmo;)
endef

define Build/Compile
endef

define Package/luci-app-adbyby-plus/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/
	cp -pR ./root/* $(1)/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n/

	find $(1) -name *.lua -exec luac -s -o {} {} \;
endef

define Package/luci-app-adbyby-plus/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	( . /etc/uci-defaults/adbyby ) && rm -f /etc/uci-defaults/adbyby
	rm -fr /tmp/luci*
	chmod 755 /etc/init.d/adbyby >/dev/null 2>&1
	/etc/init.d/adbyby enable >/dev/null 2>&1
fi
exit 0
endef

define Package/luci-app-adbyby-plus/prerm
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
     /etc/init.d/adbyby disable
     /etc/init.d/adbyby stop
fi
exit 0
endef

$(eval $(call BuildPackage,luci-app-adbyby-plus))

# call BuildPackage - OpenWrt buildroot signature







