local platform = require("utils.platform")
local backdrops = require("utils.backdrops")

return {
	front_end = "WebGpu",
	webgpu_power_preference = platform.is_windows and "HighPerformance" or "LowPower",
	max_fps = 60,

	-- 更稳、更省重绘
	animation_fps = 1,
	cursor_blink_rate = 0,
	default_cursor_style = "SteadyBlock",

	-- 干净 UI
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	enable_scroll_bar = false,

	-- background: pass in `true` if you want wezterm to start with focus mode on (no bg images)
	background = backdrops:initial_options({ no_img = false }),

	-- 窗口
	adjust_window_size_when_changing_font_size = false,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 6,
		right = 6,
		top = 6,
		bottom = 6,
	},

	-- 视觉
	color_scheme = "Catppuccin Mocha",
	window_background_opacity = 1.0,
	inactive_pane_hsb = {
		saturation = 0.92,
		brightness = 0.82,
	},

	underline_thickness = "1.4pt",
}
