

m = Map("vlmcsd")
m.title	= translate("KMS服务器设置")
m.description = translate("A KMS Serever Emulator to active your Windows or Office")

s = m:section(TypedSection, "vlmcsd")
s.addremove = false
s.anonymous = true

s:tab("basic", translate("Basic Setting"))
enable = s:taboption("basic",Flag, "enabled", translate("Enable"))
enable.rmempty = false

autoactivate = s:taboption("basic", Flag, "autoactivate", translate("自动激活局域网客户端"))
autoactivate.rmempty = false

s:tab("config", translate("Config File"))
config = s:taboption("config", Value, "config", translate("配置文件"), translate("This file is /etc/vlmcsd.ini."), "")
config.template = "cbi/tvalue"
config.rows = 13
config.wrap = "off"

function config.cfgvalue(self, section)
	return nixio.fs.readfile("/etc/vlmcsd.ini")
end

function config.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	nixio.fs.writefile("/etc/vlmcsd.ini", value)
end

return m
