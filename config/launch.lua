local platform = require("utils.platform")

local launch_menu = {}

if platform.is_windows then
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
elseif platform.is_macos then
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
