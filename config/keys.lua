local wezterm = require("wezterm")
local act = wezterm.action
local platform = require("utils.platform")

local copy_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local paste_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local search_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local reload_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local font_mods = platform.is_macos and "CMD" or "CTRL"

local function paste_remote_clipboard_image(window, pane)
	if not platform.is_windows then
		window:toast_notification("remote-paste-image", "This shortcut is configured for Windows + WSL", nil, 3000)
		return
	end

	local success, stdout, stderr = wezterm.run_child_process({
		"wsl.exe",
		"--distribution",
		"Ubuntu",
		"--exec",
		"bash",
		"-lc",
		"bash /mnt/c/Users/Jackie/.config/wezterm/scripts/remote-paste-image",
	})

	stdout = stdout or ""
	stderr = stderr or ""
	local output = stdout:gsub("%s+$", "")
	local err = stderr:gsub("%s+$", "")

	if not success then
		window:toast_notification("remote-paste-image failed", err ~= "" and err or "Command failed", nil, 6000)
		return
	end

	if output == "__NO_IMAGE__" then
		window:toast_notification("remote-paste-image", "Windows clipboard has no image", nil, 3000)
		return
	end

	if output:find("^__ERROR__:") then
		window:toast_notification("remote-paste-image failed", output, nil, 6000)
		return
	end

	if output ~= "" then
		pane:send_text(output)
		window:toast_notification("remote-paste-image", "Uploaded: " .. output, nil, 3000)
	else
		window:toast_notification("remote-paste-image failed", "Command returned no path", nil, 6000)
	end
end

return {
	disable_default_key_bindings = true,

	keys = {
		-- 基础
		{ key = "c", mods = copy_mods, action = act.CopyTo("Clipboard") },
		{ key = "v", mods = paste_mods, action = act.PasteFrom("Clipboard") },
		{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

		-- 搜索 / 配置 / 显示
		{ key = "f", mods = search_mods, action = act.Search({ CaseInSensitiveString = "" }) },
		{ key = "r", mods = reload_mods, action = act.ReloadConfiguration },
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
		{ key = "u", mods = "CTRL|SHIFT", action = wezterm.action_callback(paste_remote_clipboard_image) },

		-- 字体大小
		{ key = "=", mods = font_mods, action = act.IncreaseFontSize },
		{ key = "-", mods = font_mods, action = act.DecreaseFontSize },
		{ key = "0", mods = font_mods, action = act.ResetFontSize },
	},

	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	},
}
