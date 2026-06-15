local wezterm = require("wezterm")
local platform = require("utils.platform")

return {
	font = wezterm.font_with_fallback({
		"Maple Mono Normal NF CN",
		"Iosevka Nerd Font Mono",
		"JetBrainsMono Nerd Font",
	}),
	font_size = 12,

	freetype_load_target = "Normal",
	freetype_render_target = "Normal",
}
