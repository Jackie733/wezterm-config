local wezterm = require("wezterm")
local platform = require("utils.platform")

return {
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
		"Iosevka Nerd Font Mono",
	}),
	font_size = 12,

	freetype_load_target = "Normal",
	freetype_render_target = "Normal",
}
