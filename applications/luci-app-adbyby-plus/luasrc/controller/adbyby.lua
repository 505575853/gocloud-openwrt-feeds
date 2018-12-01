
module("luci.controller.adbyby", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/adbyby") then
		return
	end
	
	page = entry({"admin", "push", "adbyby"}, cbi("adbyby"), _("广告屏蔽大师 Plus+"), 10)
	page.i18n = "adbyby"
	page.dependent = true

end


