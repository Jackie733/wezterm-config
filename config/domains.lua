local wezterm = require("wezterm")
local platform = require("utils.platform")

if not platform.is_windows then
	return {}
end

local wsl_domains = wezterm.default_wsl_domains()
local default_domain = nil

for _, dom in ipairs(wsl_domains) do
	if dom.name == "WSL:Ubuntu" then
		-- 建议优先在 WSL 内 chsh 设置默认 shell
		-- 这里不强行写死 fish/zsh/bash
		dom.default_cwd = "~"
		default_domain = dom.name
	end
end

if default_domain == nil and #wsl_domains > 0 then
	default_domain = wsl_domains[1].name
end

return {
	wsl_domains = wsl_domains,
	default_domain = default_domain,
}
