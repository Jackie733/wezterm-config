local wezterm = require("wezterm")
local is_windows = wezterm.target_triple:find("windows") ~= nil
local is_macos = wezterm.target_triple:find("apple") ~= nil

local launch_menu = {}

if is_windows then
	launch_menu = {
		{
			label = "WSL: Ubuntu",
			args = { "wsl.exe", "-d", "Ubuntu" },
		},
		{
			label = "PowerShell",
			args = { "pwsh.exe", "-NoLogo" },
		},
		{
			label = "Command Prompt",
			args = { "cmd.exe" },
		},
	}
elseif is_macos then
	launch_menu = {
		{
			label = "zsh",
			args = { "/bin/zsh", "-l" },
		},
		{
			label = "bash",
			args = { "/bin/bash", "-l" },
		},
	}
end

return {
	launch_menu = launch_menu,
}
