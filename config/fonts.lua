local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
	}),
	font_size = 11,

	freetype_load_target = "Normal",
	freetype_render_target = "Normal",
}
