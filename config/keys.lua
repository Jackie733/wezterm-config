local wezterm = require("wezterm")
local act = wezterm.action
local platform = require("utils.platform")

local copy_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local paste_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local search_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local reload_mods = platform.is_macos and "CMD" or "CTRL|SHIFT"
local font_mods = platform.is_macos and "CMD" or "CTRL"

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
