module("luci.controller.vlmcsd", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/vlmcsd") then
		return
	end
	
	entry({"admin", "push"}, firstchild(), _("扩展插件"),  44).dependent = false
	
	local page
	page = entry({"admin", "push", "vlmcsd"}, cbi("vlmcsd"), _("KMS 服务器"), 11)
	page.i18n = "vlmcsd"
	page.dependent = true
end


