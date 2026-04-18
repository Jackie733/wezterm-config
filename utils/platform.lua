local wezterm = require("wezterm")

local target = wezterm.target_triple or ""

return {
	is_windows = target:find("windows") ~= nil,
	is_macos = target:find("apple") ~= nil,
	is_linux = target:find("linux") ~= nil,
}
