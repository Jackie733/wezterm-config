local wezterm = require("wezterm")
local act = wezterm.action

return {
	disable_default_key_bindings = true,

	leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 },

	keys = {
		-- 基础
		{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
		{ key = "f", mods = "CTRL|SHIFT", action = act.Search({ CaseInSensitiveString = "" }) },
		{ key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
		{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },

		-- 新窗口
		{ key = "n", mods = "CTRL|SHIFT", action = act.SpawnWindow },

		-- pane split
		{ key = "\\", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "-", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- pane navigation
		{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

		-- pane resize
		{ key = "LeftArrow", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Left", 3 }) },
		{ key = "RightArrow", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Right", 3 }) },
		{ key = "UpArrow", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "DownArrow", mods = "CTRL|ALT", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- zoom pane
		{ key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },

		-- close pane
		{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },

		-- scroll
		{ key = "PageUp", mods = "NONE", action = act.ScrollByPage(-0.8) },
		{ key = "PageDown", mods = "NONE", action = act.ScrollByPage(0.8) },

		-- font size
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },

		-- launcher
		{ key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	},

	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},
	},
}
