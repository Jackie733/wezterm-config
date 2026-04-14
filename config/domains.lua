local wezterm = require("wezterm")

local wsl_domains = wezterm.default_wsl_domains()

for _, dom in ipairs(wsl_domains) do
	if dom.name == "WSL:Ubuntu" then
		-- 建议优先在 WSL 内 chsh 设置默认 shell
		-- 这里不强行写死 fish/zsh/bash
		dom.default_cwd = "~"
	end
end

return {
	wsl_domains = wsl_domains,
	default_domain = "WSL:Ubuntu",
}
